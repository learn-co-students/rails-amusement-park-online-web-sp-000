class RidesController < ApplicationController

  def create
    #code for ride logic here
    @ride = Ride.create(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    @user = @ride.user
    flash[:alert] = @ride.take_ride
    redirect_to @user
  end

end
