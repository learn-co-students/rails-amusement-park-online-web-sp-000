class AttractionsController < ApplicationController

  def index 
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def show
    find_attraction
  end

  def edit
    find_attraction
  end

  def update
    find_attraction.update(attraction_params)
    redirect_to attraction_path
  end

  def destroy
  end

  private 

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end