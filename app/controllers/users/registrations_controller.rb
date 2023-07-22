# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user,{only:[:edit,:update]}
  before_action :forbid_login_user, {only: [:new, :create]}
  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @icon_image_name =  "default_user.jpg"
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "会員登録が完了しました"
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

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

  def profile_edit

  end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to root_path, notice: "ユーザー情報を更新しました"
    else
      render "profile_edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :icon_image_name, :self_introduce)
  end
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :icon_image_name, :self_introduce)
  end

  # The path used after sign up.
  #def after_sign_up_path_for(resource)
  #  user_path
  #end

  # The path used after sign up for inactive accounts.
  #def after_inactive_sign_up_path_for(resource)
  #  new_user_registration_path
  #end
end
