class RidesController < ApplicationController
    def create
        @ride = Ride.new(ride_params)
        if logged_in?
            @ride.save(ride_params)
        end
        redirect_to user_path(current_user)
    end

    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end
end