class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #追加したアクション
  def after_sign_up_path_for(resource)
    "/user/#{current_user.id}"
  end

  protected

  #入力フォームからアカウント情報をdbに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
end
