class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :avatar, :favorite_genre, :location
end
