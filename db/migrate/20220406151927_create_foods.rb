class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :genre_id
      t.text :introduction
      t.integer :comment_id

      t.timestamps
    end
  end
end
