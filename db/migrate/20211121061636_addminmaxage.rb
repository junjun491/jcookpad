class Addminmaxage < ActiveRecord::Migration[6.1]
  def change
    add_column :standards, :min_age, :integer
    add_column :standards, :max_age, :integer
  end
end
