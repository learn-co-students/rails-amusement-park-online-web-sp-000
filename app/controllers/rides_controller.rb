class RidesController < ApplicationController

    def create
        ride = Ride.new(ride_params)
        ride.save if ride.eligible_user?
        flash[:message] = ride.take_ride        
        
        redirect_to user_path(ride.user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
        
end