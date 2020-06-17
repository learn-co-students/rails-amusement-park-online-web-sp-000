class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    attraction.save

    redirect_to attraction_path(attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    attraction_params
    attraction = Attraction.find_by(id: params[:id])
    attraction.update(name: attraction_params[:name], tickets: attraction_params[:tickets], nausea_rating: attraction_params[:nausea_rating], happiness_rating: attraction_params[:happiness_rating], min_height: attraction_params[:min_height])
    
    redirect_to attraction_path(attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
