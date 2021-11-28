class Removeage03 < ActiveRecord::Migration[6.1]
  def change
    remove_column :standards, :age, :integer
  end
end
