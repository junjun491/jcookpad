class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :rimage, ImageUploader #追記
end
