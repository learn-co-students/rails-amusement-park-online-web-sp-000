class RidesController < ApplicationController


    def create
         byebug
        ride=Ride.create(ride_params)
        # byebug
        ride.take_ride
        
        redirect_to user_path(current_user)
    end



     
    private
     
    def ride_params
         params.require(:ride).permit(:attraction_id, :user_id)
    end
end
