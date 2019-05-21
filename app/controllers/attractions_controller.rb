class AttractionsController < ApplicationController

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end
  
  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
