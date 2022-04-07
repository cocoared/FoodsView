class AddItemCodeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :item_code, :integer
  end
end
