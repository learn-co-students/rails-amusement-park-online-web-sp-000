class RideController < ApplicationController
  def create
    @ride = Ride.create(:user_id => session[:user_id],  :attraction_id => params[:attraction_id])
    @ride_taken = @ride.take_ride
    redirect_to user_path(@ride.user, :ride_taken => @ride_taken)
  end
end
