class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        @user = current_user
        @ride = Ride.new
    end

    def new
        if logged_in? && current_user.admin
            @attraction = Attraction.new
        else
            redirect_to root_path
        end
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def edit
        if logged_in? && current_user.admin
            @attraction = Attraction.find_by_id(params[:id])
        else
            redirect_to signin_path
        end
    end

    def update
        attraction = Attraction.find_by_id(params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end