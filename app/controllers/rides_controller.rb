class RidesController < ApplicationController

  def create
    @ride = Ride.new(user_id: params['user']['id'], attraction_id: params['attraction']['id'])
    redirect_to user_path(@ride.user), alert: @ride.take_ride
  end

end
