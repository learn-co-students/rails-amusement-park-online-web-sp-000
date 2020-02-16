class RidesController < ApplicationController
    def create
        ride = Ride.create(ride_params)
        if ride
            message = ride.take_ride
            flash[:notice] = message
            redirect_to user_path(ride.user)
        else
            redirect_to attraction_path(ride.attraction)
        end
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end