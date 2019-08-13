class AttractionsController < ApplicationController
    def show
        @attraction = Attraction.find(params[:id])
    end

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def create
        @attraction = Attraction.new(params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating))
        if @attraction.save
            redirect_to attraction_path(@attraction)
        end
    end

    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating))
            redirect_to attraction_path(@attraction)
        end
    end
end
