class RemoveGenreIdFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :genre_id, :integer
  end
end
