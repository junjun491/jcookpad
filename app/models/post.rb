class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :rimage, ImageUploader #追記

  def self.search(rn, ing)
    return Post.all unless search
    Post.where(['rname LIKE ?', "%#{rn}%"]).Post.where(['ingredient LIKE ?', "%#{ing}%"])
  end

end
