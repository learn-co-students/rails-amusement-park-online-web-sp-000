class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
  end

  def create
    user = current_user
    attraction = user.attractions.build(attractions_params)
    attraction.save
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  private

  def attractions_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end