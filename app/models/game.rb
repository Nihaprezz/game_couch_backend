class Game < ApplicationRecord
    has_many :liked_games
    has_many :mainusers, through: :liked_games

    has_many :comments
end
