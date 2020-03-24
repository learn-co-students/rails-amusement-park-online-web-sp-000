class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @current_user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @current_user = current_user
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    @current_user = current_user
  end

  def create
    @attraction = Attraction.create(attractions_params)
    redirect_to "/attractions/#{@attraction.id}"
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attractions_params)
    redirect_to "/attractions/#{@attraction.id}"
  end

  private

  def attractions_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_rating
    )
  end

end
