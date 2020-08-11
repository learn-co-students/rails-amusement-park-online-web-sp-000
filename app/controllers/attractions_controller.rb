class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    # @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit', :alert => "Please fill in all fields."
    end
  end

  private

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
