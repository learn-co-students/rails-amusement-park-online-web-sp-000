class RidesController < ApplicationController
    before_action :logged_in?
    def create
        @ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
        @message = @ride.take_ride
        redirect_to user_path(@ride.user, message: @message)
        #I don't know what the msg is for
    end
end
