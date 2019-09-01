class RidesController < ApplicationController

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction])
    ride_allowed = @ride.take_ride

    if ride_allowed == true
      if @ride.save
        flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
        redirect_to @ride.user
      end
    else
      flash[:notice] = ride_allowed
      redirect_to @ride.user
    end  
  end
end
