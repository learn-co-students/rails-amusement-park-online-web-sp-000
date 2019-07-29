class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        @attraction = Attraction.find_by(:id => params[:id])
        @user = current_user
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.new(attraction_params)
        if attraction.save
            redirect_to attraction_path(attraction)
        end
    end

    def edit
        @attraction = Attraction.find_by(:id => params[:id])
        
    end

    def update
        @attraction = Attraction.find_by(:id => params[:id])
        @attraction.update(attraction_params)
        if @attraction.save

            redirect_to attraction_path(@attraction)
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
    end
end