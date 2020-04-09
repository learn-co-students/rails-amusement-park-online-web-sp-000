class RidesController < ApplicationController
  def create
    Ride.create(ride_params)
    redirect_to user_path(User.find(session[:user_id]))
  end
  
  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
