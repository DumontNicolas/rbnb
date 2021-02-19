class ReservationsController < ApplicationController
  def index
    @authorized_user = false
    @user = User.find(params[:user_id])
    @reservations = policy_scope(Reservation).order(created_at: :desc).where("user_id = #{@user.id}") 
    if @user == current_user
      @authorized_user = true   
    else
      redirect_to root_path
    end
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @game = Game.find(params[:reservation][:game])
    @reservation = Reservation.new(reservation_params)
    start_date = reservation_params["start_date"].split('to')[0].strip
    end_date = reservation_params["start_date"].split('to')[1].strip
    @reservation.start_date = start_date
    @reservation.end_date = end_date
    nights = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.game = @game
    @reservation.game = @game
    @reservation.user = current_user
    @reservation.total = [@game.price, @game.price * nights].max
    @reservation.status = "Pending"
    authorize @reservation
    if @reservation.save!
      redirect_to user_reservations_path(@reservation.user)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    @game = Game.find(params[:reservation][:game])
    @reservation.game = @game
    authorize @reservation
    if @reservation.update(reservation_params)
      redirect_to user_reservations_path(@reservation.user)
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :status)
  end
end
