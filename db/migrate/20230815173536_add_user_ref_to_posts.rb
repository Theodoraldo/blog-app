class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :users, null: false, foreign_key: true
    rename_column :posts, :users_id, :author_id
  end
end
