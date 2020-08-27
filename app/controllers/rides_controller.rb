class RidesController < ApplicationController
    def create
        @ride = Ride.create(ride_params)
        flash[:message] = @ride.take_ride
        # binding.pry
        
        redirect_to user_path(@ride.user)
    end 

private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
    
end