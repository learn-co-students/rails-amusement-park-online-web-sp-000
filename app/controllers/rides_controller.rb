class RidesController < ApplicationController
    def create
        # binding.pry
        @ride = Ride.create(ride_params)
        if @ride
            take_ride
            redirect_to user_path(@ride.user)
        end
    end

    def take_ride
        binding.pry
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
