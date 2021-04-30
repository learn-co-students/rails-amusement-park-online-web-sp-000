class RidesController < ApplicationController
  def create
    ride = Ride.create(rides_params)
    message = ride.take_ride
    redirect_to user_path(ride.user), flash: {message: message}
  end

  private
  def rides_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
