class RenameImageColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :image, :rimage

  end
end
