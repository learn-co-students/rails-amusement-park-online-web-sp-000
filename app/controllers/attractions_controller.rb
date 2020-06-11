class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if current_user.admin?
            @attraction.save
        end
        redirect_to attractions_path
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    def destroy
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
