class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :liked_games, foreign_key: "mainuser_id"
    has_many :games, through: :liked_games 
    has_many :comments, through: :games

    has_many :post
    
    #SELF JOINTS
    # FRIENDSHIPS WORKING NOW! DO NOT MESS UP CODE #
    has_many :friendships, foreign_key: "mainuser_id"
    has_many :friends, class_name: "Friendship", foreign_key: "friend_id"
    
    has_many :friends, through: :friendships
    has_many :mainusers, through: :friendships



    #user can be a a main user or a friend
end
