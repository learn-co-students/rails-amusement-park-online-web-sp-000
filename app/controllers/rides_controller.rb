class RidesController < ApplicationController

    def create
        ride = Ride.new(ride_params)

        if ride.enough_tickets && ride.tall_enough
            ride.save
            ride.take_ride
            flash[:notice] = "Thanks for riding the #{Attraction.find_name(params[:ride][:attraction_id])}!"
        else
            flash[:notice] = ride.take_ride
        end 
        
        redirect_to user_path(params[:ride][:user_id])
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end