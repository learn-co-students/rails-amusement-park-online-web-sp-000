class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    @message = @ride.take_ride

    if @message.include?("Thanks")
      @ride.save
      flash[:message] = @message
      redirect_to user_path(current_user)
    else
      flash[:message] = @message
      redirect_to user_path(current_user)
    end
  end

  private
  def ride_params
    params.permit(:attraction_id, :user_id)
  end
end
