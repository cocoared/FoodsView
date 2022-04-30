class Food < ApplicationRecord
  has_many :comments, dependent: :destroy
  # belongs_to :genre
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

end
