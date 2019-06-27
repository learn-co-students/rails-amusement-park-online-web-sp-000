class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    redirect_to attractions_path if !is_admin?
  end

  def create
    attraction = Attraction.new(attraction_params)
    attraction.save
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.update(params[:id], attraction_params)
    redirect_to attraction_path(attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def attraction_params
    params.require(:attraction).permit(:min_height, :nausea_rating, :tickets, :happiness_rating, :name)
  end
end
