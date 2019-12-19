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
        
        # if gameFound then 
        #     newComment = Comment.create(mainuser_id: currentUser.id, game_id: gameFound.id, content: review)
        #     render json: {}
        # end

        byebug
    end

end
