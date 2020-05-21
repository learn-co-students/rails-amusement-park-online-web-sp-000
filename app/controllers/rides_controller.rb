class RidesController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: @user.id)
    session[:message] = @ride.take_ride
    redirect_to user_path(session[:user_id])
  end

end
