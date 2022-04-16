class Comment < ApplicationRecord
 belongs_to :user
 belongs_to :admin
 belongs_to :food
end
