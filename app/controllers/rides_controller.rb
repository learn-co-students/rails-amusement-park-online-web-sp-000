class RidesController < ApplicationController
    def create
        #binding.pry
        @ride = Ride.new(:user_id =>current_user.id, :attraction_id =>params[:attraction_id])
        msg = @ride.take_ride
        if msg
            redirect_to user_path(current_user), alert: msg
        else
            redirect_to user_path(current_user), alert: "Thanks for riding the #{@ride.attraction.name}!"
        end 
    
    end
end