class RidesController < ApplicationController
  before_action :logged_in?

  def create
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])

    if ride
      message = ride.take_ride
      flash[:notice] = message
      redirect_to user_path(ride.user)
    else
      redirect_to attraction_path(ride.attraction)
    end
  end

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
