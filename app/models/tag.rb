class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :foods, through: :tagmaps
end
