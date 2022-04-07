class AddQuantityToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :quantity, :decimal, precision: 7, scale:2 , default: 1, null: 0
  end 
end
