class RidesController < ApplicationController

  def create
    @ride = Ride.create(ride_params)
    if @ride.take_ride == true
      flash[:alert] = "Thanks for riding the #{@ride.attraction.name}!"
    else
      flash[:alert] = @ride.take_ride
    end

    redirect_to user_path(current_user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
