class RidesController < ApplicationController

    def create
        
        @ride = Ride.new(:attraction_id => params[:attraction_id])
        @ride.user_id = session[:user_id]
        @ride.save
        flash[:message] = @ride.take_ride
        
        redirect_to user_path(@ride.user)
    end


end