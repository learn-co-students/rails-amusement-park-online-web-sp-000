class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create attraction_params
    redirect_to attraction_path @attraction
  end

  def edit
    set_attraction_by_params
  end

  def update
    set_attraction_by_params
    @attraction.update attraction_params
    redirect_to attraction_path @attraction
  end

  def show
    set_attraction_by_params
    @user = current_user
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end

  def set_attraction_by_params
    @attraction = Attraction.find_by params.permit(:id)
  end
end
