class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :rimage, ImageUploader #追記

  has_one_attached :rimage

  def self.search(search,ord,categ)
    return Post.all unless search



    # 各ワードのORクエリを作る
    words = search.to_s.gsub(/(?:[[:space:]%_])+/, " ").split(" ")
    word_queries = words.map do |w|
    Post.where('rname LIKE ?', "%#{w}%").or(Post.where('ingredient LIKE ?', "%#{w}%"))
    end

    # それらをAND条件で繋げる
    result = word_queries.inject(Post) do |scope, query|
      scope.merge(query)
    end


   
    if ord == "null" && categ == "null" then
      return result
    elsif ord == "ascend" then
      p "ascend"

        result.order(categ)
    else
      p "descend"


        result.order("#{categ} DESC")

    end



  end



  def mypost
    return Post.find_by(id: self.user_id)
  end
    has_many :likes
    has_many :liked_users, through: :likes, source: :user


end
