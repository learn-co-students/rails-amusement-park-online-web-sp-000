class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @user = User.find(session[:user_id]) if session[:user_id]
    @attraction = Attraction.find(params[:id])
  end

  def new
  end

  def create
    @attraction = Attraction.create(strong_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(strong_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

  def strong_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end
end
