class GameController < ApplicationController
    require 'rest-client'
    skip_before_action :authorized

    GAMEURL = "https://api.rawg.io/api/games/"

    def popular
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

end
