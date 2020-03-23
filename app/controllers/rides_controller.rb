class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
     @ride = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction])
     @message = @ride.take_ride
     user = @ride.user
     redirect_to user_path(user), flash: {notice: @message}
  end
end
