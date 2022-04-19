class ChangeDataRateToComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :rate, :float
  end
end
