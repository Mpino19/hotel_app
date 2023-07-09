class ProfilesController < ApplicationController
  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render template: "profiles/edit"
    end
  end

  def destroy
  end

  private

  def user_params
    params.permit(:name, :icon_image_name, :self_introduce)
  end
end
