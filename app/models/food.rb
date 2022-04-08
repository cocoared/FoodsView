class Food < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :genre
end
