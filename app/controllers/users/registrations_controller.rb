# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end


   def edit
     super

     @std = user_std

   end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def detail
  @user = User.find_by(id: params[:id])
  end
  def after_sign_up_path_for(_resource)
  "/user/#{current_user.id}"
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
      else
        p "xx"
      end
    else
      return Standard.find_by(Category: "m30-49")
    end
  end




end
