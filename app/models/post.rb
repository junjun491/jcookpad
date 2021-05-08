class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :rimage, ImageUploader #追記

  def self.search(search)
    return Post.all unless search

    # 各ワードのORクエリを作る
    words = search.to_s.gsub(/(?:[[:space:]%_])+/, " ").split(" ")
    word_queries = words.map do |w|
    Post.where('rname LIKE ?', "%#{w}%").or(Post.where('ingredient LIKE ?', "%#{w}%"))
    end

    # それらをAND条件で繋げる
    word_queries.inject(Post) do |scope, query|
      scope.merge(query)
    end

  end

  def user_std(current_user)
    if current_user.sex == 0
      if (1..2)==current_user.age then
        return Standard.find_by(Category: "m1-2")
      elsif (3..5)==current_user.age then
        return Standard.find_by(Category: "m3-5")
      elsif (6..7)==current_user.age then
        return Standard.find_by(Category: "m6-7")
      elsif (8..9)==current_user.age then
        return Standard.find_by(Category: "m8-9")
      elsif (10..11)==current_user.age then
        return Standard.find_by(Category: "m10-11")
      elsif (12..14)==current_user.age then
        return Standard.find_by(Category: "m12-14")
      elsif (15..17)==current_user.age then
        return Standard.find_by(Category: "m15-17")
      elsif (18..29)==current_user.age then
        return Standard.find_by(Category: "m18-29")
      elsif (30..49)==current_user.age then
        return Standard.find_by(Category: "m30-49")
      elsif (50..64)==current_user.age then
        return Standard.find_by(Category: "m50-64")
      elsif (65..74)==current_user.age then
        return Standard.find_by(Category: "m3-2")
      elsif 75==current_user.age then
        return Standard.find_by(Category: "m75")
      end
    elsif current_user.sex == 1
      if (1..2)==current_user.age then
        return Standard.find_by(Category: "f1-2")
      elsif (3..5)==current_user.age then
        return Standard.find_by(Category: "f3-5")
      elsif (6..7)==current_user.age then
        return Standard.find_by(Category: "f6-7")
      elsif (8..9)==current_user.age then
        return Standard.find_by(Category: "f8-9")
      elsif (10..11)==current_user.age then
        return Standard.find_by(Category: "f10-11")
      elsif (12..14)==current_user.age then
        return Standard.find_by(Category: "f12-14")
      elsif (15..17)==current_user.age then
        return Standard.find_by(Category: "f15-17")
      elsif (18..29)==current_user.age then
        return Standard.find_by(Category: "f18-29")
      elsif (30..49)==current_user.age then
        return Standard.find_by(Category: "f30-49")
      elsif (50..64)==current_user.age then
        return Standard.find_by(Category: "f50-64")
      elsif (65..74)==current_user.age then
        return Standard.find_by(Category: "f3-2")
      elsif 75==current_user.age then
        return Standard.find_by(Category: "f75")
      end
    end
  end

  def mypost
    return Post.find_by(id: self.user_id)
  end
    has_many :likes
    has_many :liked_users, through: :likes, source: :user


end
