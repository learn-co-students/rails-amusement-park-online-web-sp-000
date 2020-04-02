class RidesController < ApplicationController

  def create
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
    if ride
      flash[:messages] = ride.take_ride
      redirect_to ride.user
    end
  end

end