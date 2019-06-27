class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    ride.save
    ride.take_ride
    if ride.error_message
      flash[:message] = ride.error_message
    else
      attraction = Attraction.find(ride_params[:attraction_id])
      flash[:message] = "Thanks for riding the #{attraction.name}!"
    end
    redirect_to user_path(ride_params[:user_id])
  end

private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
