class AddColumnStandard < ActiveRecord::Migration[6.1]
  def change
  add_column :standards, :Category, :string
  add_column :standards, :xEnergy, :decimal, precision: 7, scale: 2
  add_column :standards, :xProtein, :decimal, precision: 7, scale: 2
  add_column :standards, :xLipid, :decimal, precision: 7, scale: 2
  add_column :standards, :xCarbohydrate, :decimal, precision: 7, scale: 2
  add_column :standards, :xDietary_fiber, :decimal, precision: 7, scale: 2
  add_column :standards, :xPotassium, :decimal, precision: 7, scale: 2
  add_column :standards, :xCalcium, :decimal, precision: 7, scale: 2
  add_column :standards, :xiron, :decimal, precision: 7, scale: 2
  add_column :standards, :xZinc, :decimal, precision: 7, scale: 2
  add_column :standards, :xVitaminA , :decimal, precision: 7, scale: 2
  add_column :standards, :xVitaminB1 , :decimal, precision: 7, scale: 2
  add_column :standards, :xVitaminB2 , :decimal, precision: 7, scale: 2
  add_column :standards, :xVitaminC , :decimal, precision: 7, scale: 2
  add_column :standards, :xSalt_equivalent, :decimal, precision: 7, scale: 2
  end
end
