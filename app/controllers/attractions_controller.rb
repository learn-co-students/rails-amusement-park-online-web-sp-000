class AttractionsController < ApplicationController
    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new
        @user = current_user
    end

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction= Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
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
        params.require(:attraction).permit(:name, :happiness_rating, :tickets, :nausea_rating, :min_height)
    end

end