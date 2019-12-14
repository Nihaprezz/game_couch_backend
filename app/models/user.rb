class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :liked_games, foreign_key: "mainuser_id"
    has_many :games, through: :liked_games 
    has_many :comments, through: :games

    has_many :posts

    #SELF JOINTS
    has_many :friendships, foreign_key: "mainuser_id"
    has_many :friends, through: :friendships, source: :friend

    has_many :friendships, foreign_key: "friend_id"
    has_many :mainusers, through: :friendships, source: :mainuser

    #user can be a a main user or a friend
end
