class ReviewsController < ApplicationController
  def index
    @reservation = Reservation.find(params[:reservation_id])
    @reviews = @reservation.reviews
    # @user = User.find(@review.user_id)
  end

  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @review.reservation = @reservation
    @game = Game.find(@review.reservation.game_id)
    @review.role = current_user == @game.user
    @review.user_id = current_user.id
    if @review.save!
      redirect_to reservation_reviews_path(@reservation)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end