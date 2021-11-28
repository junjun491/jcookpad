class Api::V1::LikesController < ApiController



  def show
    # raise StandardError if current_user == User.find(params[:id])
    
    #render json: current_user.liked_posts
    @liked_lists = current_user.liked_posts

    render "show", formats: :json, handlers: "jbuilder"
  end


        def create
          @like = current_user.likes.create(post_id: params[:post_id])
          redirect_back(fallback_location: root_path)
        end
      
        def destroy
          
          @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
          @like.destroy
          redirect_back(fallback_location: root_path)
        end
      
        def list
          @user = User.find(params[:id])
          @posts = @user.liked_posts
          if user_signed_in?
            @std = current_user.get_standard
          else
            @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
          end
          gon.std = @std
          gon.posts = @posts
          
          render json: posts
      
        end
      
        def index
          render json:  current_user.get_standard

        end
      
      end
      