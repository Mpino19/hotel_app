# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :forbid_login_user, {only: [:new, :create]}
  # GET /resource/sign_in
  def new

  end

  # POST /resource/sign_in
  def create
    @user = User.find_by(email: params[:email], encrypted_password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      @email = params[:email]
      @password = params[:password]
      render :new
    end
  end

  # DELETE /resource/sign_out
  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_in_params
  #  devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  #end
end
