class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.valid?
      attraction.save
      redirect_to "/attractions/#{attraction.id}"
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
