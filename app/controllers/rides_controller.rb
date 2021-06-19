class RidesController < ApplicationController
  

  def create
    # byebug
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect_to "/users/#{session[:user_id]}", notice: message
  end

private
  def ride_params
    params.permit(:attraction_id, :user_id)
  end
end