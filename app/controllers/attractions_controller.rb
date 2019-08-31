class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]

  def show
    @attraction = Attraction.find(params[:id])
  #  @user = User.find(params[:id])

  end

  def index
  #  binding.pry
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attr_params)
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      render :new
    end

  def edit
  #  @attraction = Attraction.find(params[:id])

  end

  def update
#    @attraction = Attraction.find(params[:id])
    @attraction.update(attr_params)
    redirect_to attraction_path(@attraction)
  end
  end

  private

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attr_params
    params.require(:attraction).permit(:name, :height, :nausea_rating, :happiness_rating, :min_height)
  end

end
