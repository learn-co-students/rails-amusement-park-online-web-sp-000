class RidesController < ApplicationController

  def create

    ride = Ride.new
    ride.attraction = Attraction.find_by(id: params[:attraction_id])
    ride.user = User.find(session[:user_id])
    ride.save

    ridden = ride.take_ride

    if ridden.instance_of? String
      flash[:message] = ridden
    else
      flash[:message] = "Thanks for riding the #{ride.attraction.name}!"
    end
    redirect_to user_path(ride.user)
  end

end
