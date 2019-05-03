class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
		@ride = Ride.new
		@user_id = session[:user_id]
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end 

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end
	
	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	private

	def attraction_params
		params.require(:attraction).permit!
	end
end
