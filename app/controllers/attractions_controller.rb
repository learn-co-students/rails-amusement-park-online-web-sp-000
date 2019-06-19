class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]
  before_action :admin_only, except: [:index, :show]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)

    return redirect_to attraction_path(attraction) if attraction.valid?

    redirect_to attractions_path
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
