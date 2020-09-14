class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end
    
    def create
        @ride = Ride.create(ride_params)
        take_ride = @ride.take_ride
        flash[:message] = take_ride
        redirect_to user_path(@ride.user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
