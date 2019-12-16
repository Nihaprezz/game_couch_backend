class UserController < ApplicationController
    before_action :authorized

    def games 
        user = User.find(@user.id)
        render json: user.games
    end

end
