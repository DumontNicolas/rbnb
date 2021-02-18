class GamesController < ApplicationController
  def index
    @games = policy_scope(Game).order(created_at: :desc)
  end

  def search
    sql_query = "name ILIKE :query OR category ILIKE :query"
    @games = policy_scope(Game).order(created_at: :desc).where(sql_query, query: "%#{params[:query]}%")
    authorize @games
    render json: @games
  end

  def show
    @users = User.all.where("id = ?", Game.find(params[:id]).user_id)
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
    {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user })
    }
    end
    @game = Game.find(params[:id])
    authorize @game
  end
  
  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    authorize @game
    if @game.save!
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    authorize @game
  end

  def update
    @game = Game.find(params[:id])
    authorize @game
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :new
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    authorize @game
    @game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :category, :price, :photo)
  end
end
