class AttractionsController < ApplicationController
  include AttractionsHelper

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @attractions = Attraction.all

  end
end
