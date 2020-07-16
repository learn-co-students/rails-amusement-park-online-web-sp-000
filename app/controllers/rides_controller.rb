class RidesController < ApplicationController

  def show
    @ride = Ride.find(params[:id])
  end

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    if @ride.take_ride == true
      redirect_to user_path(current_user), notice: "Thanks for riding the #{Attraction.find(@ride.attraction_id).name}!"
    else
      redirect_to user_path(current_user), notice: "#{@ride.take_ride}"
    end

  end

  private

  def ride_params
    params.required(:ride).permit(:user_id, :attraction_id)
  end

end
