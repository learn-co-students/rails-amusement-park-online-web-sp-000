class RidesController < ApplicationController
  def create
    ride = new_ride
    ride.save
    session[:ride_message] = ride.take_ride
    redirect_to user_path(current_user)
  end

  private
    
  def new_ride
    ride = Ride.new
    ride.attraction_id = params[:ride][:attraction_id]
    ride.user_id = current_user.id
    ride
  end

end
