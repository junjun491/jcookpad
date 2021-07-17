# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @std = user_std
    super
  end

  

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

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
      else
        p "xx"
      end
    else
      return Standard.find_by(Category: "m30-49")
    end
  end
end
