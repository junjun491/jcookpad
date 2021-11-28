class LikesController < ApplicationController

  def list
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
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

end
