class AttractionsController < ApplicationController
  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def new
    @attraction = Attraction.new
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
    @attraction.update(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:id, :name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end
end
