class UserController < ApplicationController
    before_action :authorized

    def allInfo 
        user = User.find(@user.id)
        render json: {likedGames: user.games, friends: user.friends}
    end

end
