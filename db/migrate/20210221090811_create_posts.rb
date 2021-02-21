class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :rname
      t.text :rinformation
      t.string :rimage
      t.text :ingredient
      t.text :procedure_1
      t.text :procedure_2
      t.text :procedure_3

      t.timestamps
    end
  end
end
