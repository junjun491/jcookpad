class Addsex02 < ActiveRecord::Migration[6.1]
  def change

    add_column :standards, :sex, :integer

  end
end
