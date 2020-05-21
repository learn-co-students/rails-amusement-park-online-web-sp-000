class AttractionsController < ApplicationController
  before_action :get_current_user, only: [:index, :show]
  before_action :get_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def edit
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def get_current_user
    @user = User.find(session[:user_id])
  end

  def get_attraction
    @attraction = Attraction.find(params[:id])
  end

end
