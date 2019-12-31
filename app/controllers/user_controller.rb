class UserController < ApplicationController
    before_action :authorized, only: [:allInfo, :edit, :recommendations, :createFollow, :destroyFollow]

    def allInfo 
        user = User.find(@user.id)
        render json: {likedGames: user.games, friends: user.friends}
    end

    def info 
        profile = User.find(params[:id])
        
        render json: {user_info: profile, likedGames: profile.games, posts: profile.posts, friends: profile.friends}
    end

    def edit
        user = User.find(@user.id)
        if params[:password] == "" then
            user.update(username: params[:user][:username], bio: params[:user][:bio], avatar: params[:user][:avatar], favorite_genre: params[:user][:favorite_genre], location: params[:user][:location])
        else 
            user.update(user_params)
        end

        render json: user.to_json
    end


    def recommendations
        currentUser = User.find(@user.id)
        genreLiked = currentUser.favorite_genre
        sameGenreUsers = User.where("favorite_genre = ?", genreLiked).first(10)
        friendsWithoutMain = sameGenreUsers.reject { | friend | friend.id == currentUser.id }

        render json: friendsWithoutMain
    end

    def createFollow
        mainUser = User.find(@user.id)
        friend = User.find(params[:id])
        newFriendShip = Friendship.create(mainuser_id: mainUser.id, friend_id: friend.id)

        render json: {joint: newFriendShip, main: newFriendShip.mainuser, friend: newFriendShip.friend}
    end

    def destroyFollow
        mainUser = User.find(@user.id)
        friend = User.find(params[:id])
        foundFriendship = Friendship.where(mainuser_id: mainUser.id, friend_id: friend.id)
        destroyed = foundFriendship[0].destroy
        render json: destroyed
    end



    #searching functionality. User will enter a username
    def search
        name = params[:name]
        foundUser = User.find_by(username: name)

        if foundUser then
            render json: foundUser
        else 
            render json: {message: "No User Found"}
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar, :favorite_genre, :location)
    end

end
