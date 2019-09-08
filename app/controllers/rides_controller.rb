require 'pry'
class RidesController < ApplicationController

  def ride
    if is_user?
      @user = current_user
      attr = Attraction.find(params[:attraction_id])
      ride = Ride.create(user: @user, attraction: attr)
      flash[:notice] = ride.take_ride
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

end
