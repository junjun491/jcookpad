class AddColumnTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
  end
end
