class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    # byebug

    # @user = User.find(session[:user_id])

  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attract_params)
    attraction.save

    redirect_to attraction_path(attraction)
  end

  private

  def attract_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
