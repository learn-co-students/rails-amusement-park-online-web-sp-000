class RidesController < ApplicationController

  def take_ride
    user = current_user
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)
    flash[:notice] = ride.take_ride
    redirect_to user_path(user)
  end

end