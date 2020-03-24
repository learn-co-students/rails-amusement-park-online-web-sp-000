class RidesController < ApplicationController
  def go_on_ride
     @attraction = Attraction.find_by(id: params[:attraction])
     @user = current_user
     @ride = Ride.new
     @ride.user = @user
     @ride.attraction = @attraction
     @ride.save
     @message = @ride.take_ride
     session[:message] = ""
     session[:message] = @message
     redirect_to user_path(@user)
  end
end
