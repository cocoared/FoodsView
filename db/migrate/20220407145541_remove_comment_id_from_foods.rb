class RemoveCommentIdFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :comment_id, :integer
  end
end
