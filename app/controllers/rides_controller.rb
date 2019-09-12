class RidesController < ApplicationController

    def create
        @attraction = Attraction.find_by(id: params['ride']['attraction_id'])
        @user = User.find_by(id: params['ride']['user_id'])

        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
        @attraction.rides << @ride
        if @ride.can_ride?
            @ride.take_ride
            flash[:message] = "Thanks for riding the #{@ride.attraction_name}!"
        else
            flash[:message] = @ride.flash_message
        end        
        redirect_to user_path(current_user)
    end
    
end