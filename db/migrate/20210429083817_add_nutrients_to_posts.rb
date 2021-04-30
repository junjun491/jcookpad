class AddNutrientsToPosts < ActiveRecord::Migration[6.1]
  def change
  add_column :posts, :Energy, :decimal, precision: 7, scale: 2
  add_column :posts, :Protein, :decimal, precision: 7, scale: 2
  add_column :posts, :Lipid, :decimal, precision: 7, scale: 2
  add_column :posts, :Carbohydrate, :decimal, precision: 7, scale: 2
  add_column :posts, :Dietary_fiber, :decimal, precision: 7, scale: 2
  add_column :posts, :Potassium, :decimal, precision: 7, scale: 2
  add_column :posts, :Calcium, :decimal, precision: 7, scale: 2
  add_column :posts, :iron, :decimal, precision: 7, scale: 2
  add_column :posts, :Zinc, :decimal, precision: 7, scale: 2
  add_column :posts, :VitaminA , :decimal, precision: 7, scale: 2
  add_column :posts, :VitaminB1 , :decimal, precision: 7, scale: 2
  add_column :posts, :VitaminB2 , :decimal, precision: 7, scale: 2
  add_column :posts, :VitaminC , :decimal, precision: 7, scale: 2
  add_column :posts, :Salt_equivalent, :decimal, precision: 7, scale: 2
  end
end
