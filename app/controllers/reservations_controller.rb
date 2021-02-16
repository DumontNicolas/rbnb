class ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @game = Game.find(params[:reservation][:game])
    @reservation = Reservation.new(reservation_params)
    nights = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.game = @game
    @reservation.user = current_user
    @reservation.total = [@game.price, @game.price * nights].max
    if @reservation.save!
      redirect_to user_reservations_path(@reservation.user)
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

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :status)
  end
end
