class RidesController < ApplicationController

  def new    
  end

  def create
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    if ride.save
      ride.take_ride
      redirect_to current_user
    else
      redirect_to attractions_path
    end
  end

end