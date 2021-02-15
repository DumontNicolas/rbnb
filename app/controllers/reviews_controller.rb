class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @review.reservation = @reservation
    @review.save
    if @review_save
      redirect_to reservation_path(@reservation)
    else render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
