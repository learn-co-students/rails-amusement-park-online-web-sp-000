class RidesController < ApplicationController

  def new    
  end

  def create
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    if ride.save
      response = ride.take_ride
      flash[:message] = response
      redirect_to user_path(ride.user)
    end
  end

end