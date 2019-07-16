class RidesController < ApplicationController
    def create
        # binding.pry
        @ride = Ride.create(ride_params)
        if @ride
            flash[:message] = @ride.take_ride
            # binding.pry
            redirect_to @ride.user
        end
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
