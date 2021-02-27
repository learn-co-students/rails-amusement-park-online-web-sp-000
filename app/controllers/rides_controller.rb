require "pry"

class RidesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @ride = Ride.new(ride_params)
    @user = @ride.user
    @attraction = @ride.attraction
    if @ride.save
      if @ride.take_ride != ""
        redirect_to @user, notice: @ride.take_ride
      else
        redirect_to @user, notice: "Thanks for riding the #{@attraction.name}!"
      end
    else
      redirect_to attraction_path(@attraction)
    end
  end

  def update
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
