class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if !!current_user.admin?
      attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(attraction.id)
    else
      flash[:alert] = "You not authorized to add an attraction"
      redirect_to attractions_path
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
     @attraction = Attraction.find(params[:id])
    if !current_user.admin?
      flash[:alert] = "You not authorized to edit an attraction"
      redirect_to attraction_path(@attraction)
    end 
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction = Attraction.update(attraction_params)
    redirect_to attraction_path
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
