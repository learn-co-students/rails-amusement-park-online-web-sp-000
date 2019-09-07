class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  private 

  def user_params
    params.require(:attraction).permit(:name, :password, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end