class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.new
        @user = current_user
        # binding.pry
    end

    def new
        @attraction = Attraction.new
    end

    def create
        if current_user.admin? 
            @attraction = Attraction.create(attraction_params)
            redirect_to @attraction
        end
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        if current_user.admin?
            @attraction = Attraction.find_by(id: params[:id])
            @attraction.update(attraction_params)
            redirect_to @attraction
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end