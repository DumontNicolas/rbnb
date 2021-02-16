class ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :status)
  end
end
