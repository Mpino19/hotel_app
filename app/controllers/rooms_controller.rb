class RoomsController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
    @room = Room.find_by()
  end
  def new
    @room = Room.new
    @user = current_user.id
  end

  def create
    @room = Room.new(room_params)
    @user = current_user.id
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :room_image).merge(user_id: current_user.id)
  end


end
