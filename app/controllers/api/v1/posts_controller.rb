class Api::V1::PostsController < ApiController
  before_action :set_post, only: [:show]
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    @posts = Post.all
    render json: @posts
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
    @like = Like.new
    render json: @post
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

  private
    def post_params
      params.require(:post).permit(:rname, :rinformation, :rimage, :rimage_cache, :ingredient, :procedure_1, :procedure_2, :procedure_3)
    end

    def set_post
      @post= Post.find(params[:id])
    end


end
