class RidesController < ApplicationController
  def do_ride
    ride = Ride.create(ride_params)
    ride.save ? (session[:message] = ride.take_ride) : (return redirect_to controller: 'users', action: 'show', id: params[:user_id])
    redirect_to user_path(ride.user)
  end

  private
  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
