class Friendship < ApplicationRecord
    belongs_to :mainuser, class_name: "User", foreign_key: :mainuser_id
    belongs_to :friend, class_name: "User", foreign_key: :friend_id
end
