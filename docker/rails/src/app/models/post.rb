class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :rimage, ImageUploader #追記

  has_one_attached :rimage

  def self.search(search,ord,categ)

    if search == ""

      before_result = Post.all

    else

    # 各ワードのORクエリを作る
    words = search.to_s.gsub(/(?:[[:space:]%_])+/, " ").split(" ")
    word_queries = words.map do |w|
    Post.where('rname LIKE ?', "%#{w}%").or(Post.where('ingredient LIKE ?', "%#{w}%"))
    end

    # それらをAND条件で繋げる
    before_result = word_queries.inject(Post) do |scope, query|
      scope.merge(query)
    end
    



    end
p "start"
    @categ = categ
@ord = ord
p @categ
p @ord




    if categ == nil then

      @categ = "id"

      result = before_result.sort{|a, b|
      a.send(@categ).to_i <=> b.send(@categ).to_i
    }
      if ord == "ascend" then
        return result
      else ord == "descend"
        return result.reverse
      end


    elsif ord == "ascend" then
      p "ascend"

      result = before_result.sort{|a, b|
      a.send(@categ).to_f <=> b.send(@categ).to_f
    }
  
  
    else
      p "descend"



      result = before_result.sort{|a, b|
      a.send(@categ).to_f <=> b.send(@categ).to_f
    }

    return result.reverse

    end



  end



  def mypost
    return Post.find_by(id: self.user_id)
  end
    has_many :likes
    has_many :liked_users, through: :likes, source: :user


end
