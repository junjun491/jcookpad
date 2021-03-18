class RenameRColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :rimage, :image
  end
end
