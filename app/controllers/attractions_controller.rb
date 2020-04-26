class AttractionsController < ApplicationController
	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	# def create
	# 	binding.pry
	# 	ride = Ride.new(user_id: session[:user_id], attraction_id: params[:id])
	# 	redirect_to user_path(User.find(session[:user_id]))
	# end


	private

	def attraction_params
		params.permit(:user_id, :attraction_id)
	end
end
