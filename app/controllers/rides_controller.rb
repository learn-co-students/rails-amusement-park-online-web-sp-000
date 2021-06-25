class RidesController < ApplicationController

    def create
        @ride = Ride.create(ride_params)
        redirect_to users_show_path(current_user), alert: "#{@ride.take_ride}"
    end

    private

    def ride_params
        params.permit(:attraction_id, :user_id)
    end
end