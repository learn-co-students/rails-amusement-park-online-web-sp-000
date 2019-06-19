class RidesController < ApplicationController
  def create
    ride = Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
    if ride
      res = ride.take_ride
      flash[:res] = res
      redirect_to user_path(ride.user)
    else
      redirect_to attraction_path(ride.attraction)
    end
  end
end
