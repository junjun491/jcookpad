class SetForeignKeyToPostTable < ActiveRecord::Migration[6.1]
  def change
    t.references :user, foreign_key: true
  end
end
