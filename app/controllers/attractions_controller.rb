class AttractionsController < ApplicationController
  def index
    @attractions=Attraction.all
  end

  def show
    @attraction=Attraction.find(params[:id])
  end

  def new
    if current_user.admin
      @attraction=Attraction.new
    else
      redirect_to attractions_path
    end
  end

  def create
    @attraction=Attraction.new(attraction_param)
    if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        redirect_to new_attraction_path
    end
  end

  def edit
    @attraction=Attraction.find(params[:id])
  end

  def update
    @attraction=Attraction.find(params[:id])
    @attraction.update(attraction_param)
    redirect_to attraction_path(@attraction)
  end

  private
  def attraction_param
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end