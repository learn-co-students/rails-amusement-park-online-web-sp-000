require 'pry'
class RidesController < ApplicationController

   def create
    
    user = User.find(session[:user_id])

    ride = Ride.new(user_id: user.id, attraction_id: params[:attraction_id])
    if ride.save
        flash[:notice] = ride.take_ride
        redirect_to user_path(user)
    end
   end

   private

   def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
   end
end
