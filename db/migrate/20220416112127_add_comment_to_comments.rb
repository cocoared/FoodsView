class AddCommentToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :admin_id, :integer
  end
end
