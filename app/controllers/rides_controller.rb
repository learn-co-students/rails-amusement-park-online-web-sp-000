class RidesController < ApplicationController

  def create # ride the ride!
    flash[:notice] = Ride.new(attraction_id: params[:attraction_id], 
                              user_id: current_user.id).
                              take_ride
    redirect_to user_path(current_user)
  end
  
end