class RidesController < ApplicationController
    def create
        ride = Ride.create(ride_params)
        flash[:notice] = ride.take_ride
        @user = User.find(session[:user_id])
        redirect_to user_path(@user)
    end

    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end
end
