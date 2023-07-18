class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = @user.reservations
  end
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to root_path
  end

private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :room_id, :user_id, :people)
  end
end
