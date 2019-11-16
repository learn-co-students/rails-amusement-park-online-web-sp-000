class AttractionsController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:new, :edit, :create, :update]

  def index
    @attractions = Attraction.all
    @user = User.find_by_id(current_user)
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(current_user)
  end

  def ride
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(current_user)
    @ride = Ride.find_or_create_by(user: @user, attraction: @attraction)
    flash[:message] = @ride.take_ride
    redirect_to(user_path(@user))
  end

  def new
    @attraction = Attraction.new
  end

  def create
    # pry
    @attraction = Attraction.new(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to(attraction_path(@attraction))
    else
      flash[:message] = "Attraction could not be validated"
      redirect_to(new_attraction_path)
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    if @attraction.update(attraction_params)
      redirect_to(attraction_path(@attraction))
    else
      flash[:message] = "Attraction could not be validated"
      redirect_to(edit_attraction_path)
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:min_height, :name, :nausea_rating, :happiness_rating, :tickets)
  end
end
