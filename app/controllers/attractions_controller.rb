class AttractionsController < ApplicationController
  before_action :logged_in?

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
    # @user = user_path(current_user)
    @attraction = Attraction.find(params[:id])
    # @ride = @attraction.rides.build(user_id:....)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit', :alert => "Please fill in all fields."
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
