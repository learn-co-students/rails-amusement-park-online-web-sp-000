class RidesController < ApplicationController

  def take_ride
    user = current_user
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)
    failure = ride.take_ride
    if failure.include?("Sorry.")
      session[:failures] = failure
      redirect_to rides_failures
    end
    redirect_to user_path(user)
  end

  def failures
    @user = current_user
    @failures = session[:failures]
  end

end