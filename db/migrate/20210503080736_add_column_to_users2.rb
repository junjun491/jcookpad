class AddColumnToUsers2 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :sex, :integer, null: false, default: 0  # 性別（0：男、1：女）
  end
end
