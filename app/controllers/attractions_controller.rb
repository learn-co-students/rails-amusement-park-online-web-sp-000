class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @ride = Ride.new
        @attraction = Attraction.find(params[:id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        return redirect_to new_attraction_path unless @attraction.save
        redirect_to attraction_path(@attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        return redirect_to edit_attraction_path unless @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
