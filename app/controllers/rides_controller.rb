class RidesController < ApplicationController
# before_action :require_login

    def create
        @ride = Ride.new(attraction_id: rides_params[:attraction_id], user_id: session[:user_id])
        @ride.save
        message = @ride.take_ride
        flash.notice = message
        redirect_to user_path(current_user)
    end


    private

    def rides_params
        params.require(:ride).permit(:attraction_id)
    end

end