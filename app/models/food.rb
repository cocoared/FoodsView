class Food < ApplicationRecord
  has_many :comments, dependent: :destroy
  # belongs_to :genre
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

# def self.items_serach(search)
#   food.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
# end

# def save_items(tags)
#   current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
#   old_tags = current_tags - tags
#   new_tags = tags - current_tags

#   # Destroy
#   old_tags.each do |old_name|
#     self.tags.delete Tag.find_by(tag_name:old_name)
#   end

#   # Create
#   new_tags.each do |new_name|
#     item_tag = Tag.find_or_create_by(tag_name:new_name)
#     self.tags << item_tag
#   end

end
