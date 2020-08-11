class RidesController < ApplicationController

    def create
        @user = current_user
        @ride = Ride.create(attraction_id: params[:attraction_id], user_id: @user.id)

        flash[:notice] = @ride.take_ride
    
        redirect_to user_path(@user)
    end

end
