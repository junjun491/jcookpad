class HomeController < ApplicationController

  def index
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
  end

  def edit
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
  end

end
