class ReviewController < ApplicationController
    before_action :authorized, only: [:create]

    def all 
        gameId = params[:id]
        gameFound = Game.find_by(game_api_id: gameId) #will return the game if found. If not found it will return nil
        
        if gameFound then
            if gameFound.comments.count == 0 then
                render json: {message: "Game Has No Reviews Yet"}
            else 
                render json: {reviews: gameFound.comments}
            end
        else 
            render json: {message: "Game Not Found In DB"}
        end
    end

    def create
        currentUser = User.find(@user.id)
        review = params[:review]
        gameId = params[:game_api_id]
        gameFound = Game.find_by(game_api_id: gameId)
        image = params[:picture]
        name = params[:name]

        #if game count create the review with the found game
        if gameFound then 
            newComment = Comment.create(mainuser_id: currentUser.id, game_id: gameFound.id, content: review, username: currentUser.username)
            render json: newComment
        else
        #if game not found then create game in db with params passed
        #and then create the review
            newGame = Game.create(game_api_id:gameId, picture: image, name: name)
            newComment = Comment.create(mainuser_id: currentUser.id, game_id: newGame.id, content: review, username: currentUser.username)

            render json: newComment
        end 
    end

end
