class AttractionsController < ApplicationController

	def new
		@attraction = Attraction.new
	end

	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def create
		if !params.values.empty?
			@attraction = Attraction.create(attraction_params)
			redirect_to attraction_path(@attraction)
		end
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

 

 	private

 	def attraction_params
 		params.require(:attraction).permit(:name, :nausea_rating, :min_height, :tickets, :tickets, :happiness_rating)
 	end
end