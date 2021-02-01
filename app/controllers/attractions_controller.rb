class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to "/attractions/#{@attraction.id}"
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
    puts @attraction.name
    redirect_to "/attractions/#{@attraction.id}"

  end



  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
