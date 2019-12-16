class Friendship < ApplicationRecord
    belongs_to :friend, class_name: "User"
    belongs_to :mainuser, class_name: "User"
end
