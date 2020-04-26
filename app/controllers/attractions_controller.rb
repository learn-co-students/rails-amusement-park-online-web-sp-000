class AttractionsController < ApplicationController
	before_action :set_user

	def new
		@attraction = Attraction.new
	end

	def create
		attraction = Attraction.create(attraction_params)

		redirect_to attraction_path(attraction)
	end

	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		attraction = Attraction.find(params[:id])
		attraction.update(attraction_params)

		redirect_to attraction_path(attraction)	
	end



	private

	def set_user
		@user = User.find(session[:user_id])
	end

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end
end
