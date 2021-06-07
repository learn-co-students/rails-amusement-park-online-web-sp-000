class RidesController < ApplicationController
  def show
  end

  def create
    ride = Ride.new(ride_params)
    message = ride.take_ride
    if message.include?("Thanks") && ride.save
      flash[:notice] = message
    else
      flash[:alert] = message
    end
    redirect_to user_path(ride.user)
  end

  private
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
end
