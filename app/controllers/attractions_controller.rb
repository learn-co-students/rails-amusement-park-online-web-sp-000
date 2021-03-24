class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @admin = current_user.admin
  end

  def show
    @attraction = Attraction.find(params[:id])
    @admin = current_user.admin
    @ride = Ride.new
  end

  # Admin features
  def new
    if !current_user
      redirect_to root_path
    elsif current_user.admin
      @attraction = Attraction.new
    else
      redirect_to attractions_path
    end
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end
    
  def edit
    if !current_user
      redirect_to root_path
    elsif current_user.admin
      @attraction = Attraction.find(params[:id])
    else
      redirect_to attractions_path
    end
  end
    
  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end
    
  private
    
  def attraction_params
    params.require(:attraction).permit(:min_height, :name, :nausea_rating, :happiness_rating, :tickets)
  end
end


