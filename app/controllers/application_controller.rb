class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:profile_update, keys: [:name, :icon_image_name, :self_introduce])
  end
  def authenticate_user
    if current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to root_path
    end
  end
  def forbid_login_user
    if current_user
      flash[:notice] = "すでにログインしています"
      redirect_to root_path
    end
  end
end
