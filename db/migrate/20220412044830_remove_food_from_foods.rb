class RemoveFoodFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :name, :string
    remove_column :foods, :introduction, :text
  end
end
