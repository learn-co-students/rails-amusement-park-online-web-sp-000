class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end 
    
    def new 
    end 

    def create
    end 

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end 

    def edit
    end 

    def update
    end


end
