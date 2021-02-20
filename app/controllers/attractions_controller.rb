class AttractionsController < ApplicationController

    def new
        @attraction = Attraction.new
    end

    def create
        a=Attraction.create(attraction_params)
        redirect_to attraction_path(a)
    end
    
    def show
        @attraction = Attraction.find_by(id: params[:id])
        #build ride here for @ride form on show page
        # @ride = Ride.new
        # @ride = @attraction.rides.build(user_id: current_user.id)
        @ride = Ride.new(user_id: current_user.id, attraction_id: @attraction.id)
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        a = Attraction.find_by(id: params[:id])
        a.update(attraction_params)
        redirect_to attraction_path(a)

    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
    end


end
