class Removeage < ActiveRecord::Migration[6.1]
  def change
    remove_column :standards, :sex, :integer
  end
end
