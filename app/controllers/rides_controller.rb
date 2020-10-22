class RidesController < ApplicationController
  def take_ride
    @user = current_user
    attraction = Attraction.find(params[:id])
    ride=Ride.create(user: @user, attraction: attraction)
    flash[:message] = ride.take_ride
    redirect_to user_path(current_user)
  end
end
