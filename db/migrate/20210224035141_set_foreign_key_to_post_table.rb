class SetForeignKeyToPostTable < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :user_id, :bigint
    add_foreign_key :posts, :users
  end
end
