class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destory]

  def index
    @user = current_user if session[:user_id]
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: 'Attraction was successfully created.'
    else
      render :new
    end
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url, notice: 'Attraction was succesfully destroyed.'
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
    end
end
