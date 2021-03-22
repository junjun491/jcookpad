class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :rimage, ImageUploader #追記

  def self.search(search)
    return Post.all unless search
    Post.where(['rname LIKE ? OR ingredient LIKE ?', "%#{search}%", "%#{search}%"])
  end

end
