class AttractionsController < ApplicationController
	before_action :set_attraction, only: [:show, :edit, :update]

	def index
		@attractions = Attraction.all
	end

	def show
		require_logged_in
		@ride = Ride.new(user_id: current_user.id, attraction_id: @attraction.id)
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def edit

	end

	def update
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end
end
