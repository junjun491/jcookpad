class PostsController < ApplicationController
  def index

    @posts = Kaminari.paginate_array(Post.all.reverse).page(params[:page]).per(10)
    gon.posts = @posts

    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    gon.std = @std

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

    @posts = Kaminari.paginate_array(Post.search(params[:search],params[:r1],params[:r2])).page(params[:page]).per(10)

    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    
  end

  def show

    @post = Post.find_by(id: params[:id])
    gon.post = @post

    @like = Like.new

    @user = current_user

    @stds = Standard.all
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end    
    gon.std = @std

  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def list
    @posts = Kaminari.paginate_array(Post.where(user_id: current_user.id ).reverse).page(params[:page]).per(10)
    gon.posts = @posts

    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    gon.std = @std

  end

  def update

    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer
    else
      render :new
    end 

  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'test_user', age: '30', sex: 'man') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def destroy

    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer

  end

  private
    def post_params

      params.permit(:rname, :rinformation, :rimage, :rimage_cache, :ingredient, :procedure_1, :procedure_2, :procedure_3)
      
    end
end
