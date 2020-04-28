class RidesController < ApplicationController
	def create
		user = User.find(session[:user_id])
		
		ride = Ride.new(user_id: user.id, attraction_id: params[:attraction_id])
		
		flash[:notice] = ride.take_ride
		redirect_to user_path(session[:user_id])
	end
end
