class RidesController < ApplicationController
    def create
        new_ride = Ride.create(ride_params)
        possible_message = new_ride.take_ride
        if possible_message.is_a? String
            flash[:alert] = possible_message
            redirect_to user_path(new_ride.user)
        else
            flash[:alert] = "Thanks for riding the #{new_ride.attraction.name}!"
            redirect_to user_path(new_ride.user)
        end
        
    end
    private
        def ride_params
            params.require(:ride).permit(:user_id, :attraction_id)
        end
end