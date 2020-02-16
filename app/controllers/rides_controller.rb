class RidesController < ApplicationController

    def new
    end

    def create
       @ride = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction])
       @message = @ride.take_ride 
       # binding.pry
       user = @ride.user
       redirect_to user_path(user, notice: @message)
    end

end