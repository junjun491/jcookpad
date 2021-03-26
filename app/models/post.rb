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

end
