class AddItemCodeToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :item_code, :integer
  end
end
