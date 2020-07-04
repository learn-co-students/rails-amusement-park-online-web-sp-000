require 'pry'
class RidesController < ApplicationController
    def create
        @ride = Ride.new(ride_params) 
        @ride.save(ride_params)
        redirect_to user_path(params[:user_id]), :flash => {:notice => @ride.take_ride}
    end

    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end
end