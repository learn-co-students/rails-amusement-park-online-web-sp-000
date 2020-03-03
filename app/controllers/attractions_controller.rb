class AttractionsController < ApplicationController
    before_action :set_attraction, :only => [:show, :edit, :update]


    def index
        @attractions = Attraction.all
    end

    def show
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to @attraction
    end

    def edit
    end

    def update
        @attraction.update(attraction_params)
        redirect_to @attraction
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end


end