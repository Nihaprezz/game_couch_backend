class UserController < ApplicationController
    before_action :authorized, only: [:allInfo, :recommendations]

    def allInfo 
        user = User.find(@user.id)
        render json: {likedGames: user.games, friends: user.friends}
    end

    def info 
        profile = User.find(params[:id])
        
        render json: {user_info: profile, likedGames: profile.games, posts: profile.posts, friends: profile.friends}
    end

    def recommendations
        currentUser = User.find(@user.id)
        genreLiked = currentUser.favorite_genre
        sameGenreUsers = User.where("favorite_genre = ?", genreLiked).first(10)
        friendsWithoutMain = sameGenreUsers.reject { | friend | friend.id == currentUser.id }

        render json: friendsWithoutMain
    end
    
end
