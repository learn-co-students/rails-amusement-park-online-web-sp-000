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
    @ride = @attraction.rides.build(user_id: session[:user_id])
    @user = User.find(session[:user_id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def destroy
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  private
  
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :height, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end
end
