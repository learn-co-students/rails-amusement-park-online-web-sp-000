class AttractionsController < ApplicationController

    def new
        
    end

    def create

    end
    
    def show
        @attraction = Attraction.find_by(id: params[:id])
        #build ride here for @ride form on show page
        # @ride = Ride.new
        # @ride = @attraction.rides.build(user_id: current_user.id)
        @ride = Ride.new(user_id: current_user.id, attraction_id: @attraction.id)
    end
end
