class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
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
  end

  private
  
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :height, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end
end
