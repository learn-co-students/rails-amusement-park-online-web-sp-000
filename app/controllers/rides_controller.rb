class RidesController < ApplicationController

  def new
    @user = User.find_by(id: params[:id])
  end

  def create
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction_id]).take_ride

    redirect_to user_path(current_user)
  end

end
