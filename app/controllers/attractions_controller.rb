class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    attraction.save ? (redirect_to attraction_path(attraction.id)) : (render 'new')
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params) ? (redirect_to attraction_path(@attraction.id)) : (render 'edit')
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
