class RidesController < ApplicationController
  def create
    attraction = Attraction.find(params[:ride][:attraction_id])
    ride = Ride.new(ride_params)
    ride.user_id = session[:user_id]
    ride.save

    flash[:alert] = ride.take_ride
    if flash[:alert] == []
      flash[:alert] = "Thanks for riding the #{attraction.name}!"
    end
    redirect_to user_path(ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end


end
