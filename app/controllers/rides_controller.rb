class RidesController < ApplicationController
  include ApplicationHelper

  def create
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
    msg = ride.take_ride
    flash[:notice] = msg
    redirect_to current_user
  end
end
