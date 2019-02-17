class RidesController < ApplicationController

  def new 
  end

  def create
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    message = ride.take_ride
    if message == true
      ride.save
      flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
    else
      flash[:notice] = message
    end 
    redirect_to user_path(ride.user_id)

  end
end
