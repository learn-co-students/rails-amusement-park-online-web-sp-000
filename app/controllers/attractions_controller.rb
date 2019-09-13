class AttractionsController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    redirect_to attractions_path unless @attraction
  end

  def ride
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    session[:ride_errors] = @ride.take_ride
    redirect_to user_path(session[:user_id])
  end

  private
 
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end