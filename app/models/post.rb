class Post < ApplicationRecord
    belongs_to :mainuser, class_name: "User"
end
