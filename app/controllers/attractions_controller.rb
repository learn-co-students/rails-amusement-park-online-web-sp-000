class AttractionsController < ApplicationController

  def show
    @attraction = Attraction.find(params[:id])
  end

  def index
  #  binding.pry
    @attractions = Attraction.all
  end



end
