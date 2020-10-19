class RidesController < ApplicationController
    def create
        ride = Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
        response = ride.take_ride
        flash[:notice] = response
        redirect_to user_path(current_user)
    end
end