class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = current_user
    @stds = Standard.all


    @std = user_std
    gon.std = @std
    gon.posts = @posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to action: 'index'
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @post = Post.search(params[:search],params[:r1],params[:r2])


    
  end

  def show
    @post = Post.find_by(id: params[:id])
    @like = Like.new

    @user = current_user
    @stds = Standard.all


    @std = user_std
    gon.std = @std
    gon.post = @post
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def list
    @post = Post.where(user_id: current_user.id )
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer
    else
      render :new
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  def user_std
    if user_signed_in?
      if current_user.sex == "man"
        p "man"
        if (1..2)===current_user.age then
          return Standard.find_by(Category: "m1-2")
        elsif (3..5)===current_user.age then
          return Standard.find_by(Category: "m3-5")
        elsif (6..7)===current_user.age then
          return Standard.find_by(Category: "m6-7")
        elsif (8..9)===current_user.age then
          return Standard.find_by(Category: "m8-9")
        elsif (10..11)===current_user.age then
          return Standard.find_by(Category: "m10-11")
        elsif (12..14)===current_user.age then
          return Standard.find_by(Category: "m12-14")
        elsif (15..17)===current_user.age then
          return Standard.find_by(Category: "m15-17")
        elsif (18..29)===current_user.age then
          return Standard.find_by(Category: "m18-29")
        elsif (30..49)===current_user.age then
          return Standard.find_by(Category: "m30-49")
          p "30"
        elsif (50..64)===current_user.age then
          return Standard.find_by(Category: "m50-64")
        elsif (65..74)===current_user.age then
          return Standard.find_by(Category: "m3-2")
        elsif 75===current_user.age then
          return Standard.find_by(Category: "m75")
        end
      elsif current_user.sex == "woman"
        p "woman"
        if (1..2)===current_user.age then
          return Standard.find_by(Category: "f1-2")
        elsif (3..5)===current_user.age then
          return Standard.find_by(Category: "f3-5")
        elsif (6..7)===current_user.age then
          return Standard.find_by(Category: "f6-7")
        elsif (8..9)===current_user.age then
          return Standard.find_by(Category: "f8-9")
        elsif (10..11)===current_user.age then
          return Standard.find_by(Category: "f10-11")
        elsif (12..14)===current_user.age then
          return Standard.find_by(Category: "f12-14")
        elsif (15..17)===current_user.age then
          return Standard.find_by(Category: "f15-17")
        elsif (18..29)===current_user.age then
          return Standard.find_by(Category: "f18-29")
        elsif (30..49)===current_user.age then
          return Standard.find_by(Category: "f30-49")
        elsif (50..64)===current_user.age then
          return Standard.find_by(Category: "f50-64")
        elsif (65..74)===current_user.age then
          return Standard.find_by(Category: "f3-2")
        elsif 75===current_user.age then
          return Standard.find_by(Category: "f75")
        end
      elsif
        p "xx"
      end
    else
      return Standard.find_by(Category: "m30-49")
    end
  end



  private
    def post_params
      params.require(:post).permit(:rname, :rinformation, :rimage, :rimage_cache, :ingredient, :procedure_1, :procedure_2, :procedure_3)
    end
end
