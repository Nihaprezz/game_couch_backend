class LikedGame < ApplicationRecord
    belongs_to :mainuser, class_name: "User"
    belongs_to :game
end
