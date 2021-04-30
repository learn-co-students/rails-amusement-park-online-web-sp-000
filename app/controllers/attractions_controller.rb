class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @attractions = Attraction.all
  end

  private
  
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :height, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end
end
