class RidesController < ApplicationController
  before_action :require_login

  def create
    @ride = current_user.rides.new(ride_params)
    result = @ride.take_ride
    if result == true
      @ride.save
      flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
    else
      flash[:message] = result
    end
    redirect_to user_path(current_user)
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end
end