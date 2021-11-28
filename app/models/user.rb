class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true #追記
  mount_uploader :image, ImageUploader #追記

  enum sex: { man: 0, woman: 1}

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def get_standard
      Standard.where(sex: self.sex_before_type_cast, min_age: ..self.age, max_age: self.age..).first
  end

end
