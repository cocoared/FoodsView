class Comment < ApplicationRecord
 belongs_to :user
 belongs_to :admin,optional: true
 belongs_to :food
end
