require 'pry'
class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    if is_admin?
      render "admin_index"
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @admin = is_admin?
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
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

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
