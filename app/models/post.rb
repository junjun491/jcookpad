class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader #追記
end
