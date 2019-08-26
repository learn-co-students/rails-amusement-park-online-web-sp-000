class AttractionsController < ApplicationController
  include AttractionsHelper

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @attractions = Attraction.all

  end

  private

     def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
     end
end
