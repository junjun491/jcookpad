class PostsController < ApplicationController
  def index
    @posts = Post.all
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
    @post = Post.search(params[:search])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end



  private
    def post_params
      params.require(:post).permit(:rname, :rinformation, :rimage, :image_cache, :ingredient, :procedure_1, :procedure_2, :procedure_3)
    end
end
