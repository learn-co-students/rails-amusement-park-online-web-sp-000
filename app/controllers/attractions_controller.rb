class AttractionsController < ApplicationController
    def create
        @attraction = Attraction.new(attraction_params)
    end

    def index
        @attractions = Attraction.all
        @attraction = Attraction.new
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets)
    end

end