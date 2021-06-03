class Api::V1::LikesController < ApiController



  def show
    # raise StandardError if current_user == User.find(params[:id])
    
    render json: current_user.liked_posts
  end

  def show_p

    p "post_image"
    
    @post = current_user.liked_posts
    @posts_p = @post.all.with_attached_rimage
    render json: @posts_p.to_json(include: { image_attachment: { include: :blob } })
    p @posts_p
    p "post_image_end"
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
          @std = user_std
          gon.std = @std
          gon.posts = @posts
          
          render json: posts
      
        end
      
        def index
          render json: user_std

          p "stdaaaaaaaaaaaaaaaa"
          p "stdaaaaaaaaaaaaaaaa"
          p "stdaaaaaaaaaaaaaaaa"
          p user_std
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
      
      end
      