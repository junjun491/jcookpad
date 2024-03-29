# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    super
  end

  # POST /resource
  def create
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    super
  end


   def edit
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
     super
   end
   
  
  # PUT /resource
  def update
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    super
  end

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
    if user_signed_in?
      @std = current_user.get_standard
    else
      @std = Standard.where(sex: 0, min_age: ..30, max_age: 30..).first
    end
    @user = User.find_by(id: params[:id])
  end
    
  def after_sign_up_path_for(_resource)
    "/user/#{current_user.id}"
  end

end
