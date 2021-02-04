class RidesController < ApplicationController

	def takeride
	ride = Ride.new(user_id: session[:user_id], attraction_id: params[:id])

    message = ride.take_ride
    redirect_to user_path(ride.user), flash: { message: message }
	end
 
end