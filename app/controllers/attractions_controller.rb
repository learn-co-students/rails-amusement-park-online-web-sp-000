class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @current_user = current_user
  end

  def new
    @attraction = Attraction.new
    #binding.pry
  end

  def show
    @current_user = current_user
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    @current_user = current_user
  end

end
