class RidesController < ApplicationController

    def create
        ride = Ride.create(ride_params)
        user = ride.user
        session[:message] = ride.take_ride
        redirect_to user_path(user)
    end

    private

    def ride_params
        params.require(:ride).permit(:attraction_id, :user_id)
    end

end