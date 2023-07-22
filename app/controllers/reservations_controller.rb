class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = @user.reservations
  end
  def new
    @reservation = Reservation.new
  end
  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to room_reservations_path
  end
  def confirm
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
  end

private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :room_id, :user_id, :people)
  end
end
