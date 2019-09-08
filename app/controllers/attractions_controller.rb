class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def new
    verify_admin
    @attraction = Attraction.new
  end
  
  def create
    @attraction = Attraction.create(attractions_params)
    redirect_to attraction_path(@attraction)
  end
  
  def edit
    verify_admin
    @attraction = Attraction.find(params[:id])
  end
  
  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  private 

  def attractions_params
    params.require(:attraction).permit(:name, :password, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

  def verify_admin
    redirect_to root_path unless current_user.admin == true
  end
end