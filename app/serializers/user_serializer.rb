class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :avatar, :favorite_genre, :location

  # def stranger
  #   genreLiked = object.favorite_genre

  #   #get all the users that are not friends with the current user which is object. 
  #   usersFriends = Friendships.where("mainuser_id != ?", object.id)
  #   #then filter through that array by which users liked the same genre is the genre
  #   # sameGenreUsers = User.where("favorite_genre = ?", genreLiked).first(10)
    
  #   byebug


  # end
end
