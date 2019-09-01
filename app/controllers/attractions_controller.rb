class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params(params[:attraction].keys))
    if @attraction.save
      redirect_to @attraction
    end
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
    if @attraction.update_attributes(attraction_params(params[:attraction].keys))
      redirect_to @attraction
    end
  end

  private
    def attraction_params(*args)
      params.require(:attraction).permit(*args)
      
    end
end
