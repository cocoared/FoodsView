class AddIsDeletedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_deleted, :boolean, default: false #退会フラグカラムの追加、falseは有効会員であることを示す
  end
end
