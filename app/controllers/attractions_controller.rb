class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def ride
    attr = Attraction.find(params[:id])
    user = User.find(session[:user_id])

    @ride = Ride.new
    @ride.attraction = attr
    @ride.user = user

    @ride.save

    errors = @ride.take_ride
    if errors == true
      flash[:notice] = "Thanks for riding the #{attr.name}!"
    else
      flash[:notice] = errors
    end

    redirect_to user

  end

  def create
    @attraction = Attraction.create(attr_params)

    if @attraction.valid?
      @attraction.save

      redirect_to @attraction
    else
      redirect_to attractions_path
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  private

  def attr_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end