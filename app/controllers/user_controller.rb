class UserController < ApplicationController
    before_action :authorized, only: [:allInfo]

    def allInfo 
        user = User.find(@user.id)
        render json: {likedGames: user.games, friends: user.friends}
    end

    def info 
        profile = User.find(params[:id])
        
        render json: {user_info: profile, likedGames: profile.games, posts: profile.posts, friends: profile.friends}
    end


end
