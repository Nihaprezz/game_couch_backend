class GameController < ApplicationController
    require 'rest-client'
    skip_before_action :authorized, :except => [:liked]

    GAMEURL = "https://api.rawg.io/api/games/"

    def popular #NOT USING ROUTE... MAY USE LATER ON
        today = Date.today.strftime("%Y-%m-%d")
        url = `https://api.rawg.io/api/games?dates=#{today},2019-12-31&ordering=-added`
    end

    def justReleased
        url = "https://api.rawg.io/api/games?dates=2019-11-01,2019-11-30&platforms=18,1,7"
        response = RestClient.get("#{url}")
        jsonParsed = JSON.parse(response)
        
        render json: jsonParsed
    end

    def show
        gameID = params[:id]
        url = GAMEURL + gameID
        response = RestClient.get("#{url}")
        gameParsed = JSON.parse(response)

        render json: gameParsed
    end

    def gameScreenshots
        gameID = params[:id]
        url = GAMEURL + gameID + "/screenshots"
        response = RestClient.get("#{url}")
        screenshots = JSON.parse(response)

        render json: screenshots
    end

    def liked
        gameID = params[:id]
        gameName = params[:name]
        gameImage = params[:image]

        gameInDB = Game.find_by(game_api_id: gameID) #will be the record or nil if not found
    
        if gameInDB then 
            #need to check if the user has already liked the game
            if LikedGame.find_by(mainuser_id: @user.id, game_id: gameInDB.id) then
                render json: { message: "Already Liked!"}, status: :service_unavailable
            else 
                liked = LikedGame.find_or_create_by(mainuser_id: @user.id, game_id: gameInDB.id)
                render json: liked, status: :accepted
            end
        else
            byebug
            #since game is not in DB it will create a record. 
            newGame = Game.find_or_create_by(game_api_id: gameID, picture: gameImage, name: gameName)

            #created the joint table record using the just created game ID and logged in user ID
            justLiked = LikedGame.find_or_create_by(mainuser_id: @user.id, game_id: newGame.id)

            #extra precaution in case the joint table does not create
            if justLiked then 
                render json: justLiked, status: :accepted
            else 
                render json: { message: "Unable to like game"}, 
                status: :service_unavailable
            end
        end

        
    end

    def search
        gameSearch = params[:name]
        url = "https://api.rawg.io/api/games?search=" + gameSearch
        response = RestClient.get("#{url}")
        searchParsed = JSON.parse(response)

        render json: searchParsed
    end

    def topGames
        year = params[:year]
        url = "https://api.rawg.io/api/games?dates=#{year}-01-01,#{year}-12-31&ordering=-added"
        resp = RestClient.get("#{url}")
        topGames = JSON.parse(resp)

        render json: topGames
    end

    def gamesByGenre
        genre = params[:genre]

        if genre == "rpg" then # catch case only for RPG games.. the API reads it differently 
            genre = "role-playing-games-rpg"
        end
        
        url = "https://api.rawg.io/api/games?genres=" + genre
        resp = RestClient.get("#{url}")
        genreGames = JSON.parse(resp)
        
        render json: genreGames
    end
end
