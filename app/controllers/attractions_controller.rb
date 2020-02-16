class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all 
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attractions_params)
        @attraction.save
        redirect_to attractions_path
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end
    
    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attractions_params)
        redirect_to attractions_path
    end

    private
    def attractions_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end