class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  # Admin features
  def create

  end

  def new

  end

  def edit

  end
end