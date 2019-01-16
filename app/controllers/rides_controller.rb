class RidesController < ApplicationController


  def create
    ride = Ride.new(ride_params)
    ride.user = current_user
    ride.save
    flash[:message] = ride.take_ride
    redirect_to user_path(current_user)
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end
end