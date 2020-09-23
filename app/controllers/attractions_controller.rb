class AttractionsController < ApplicationController

    def new 
        binidng.pry
    end 

    def index 
        @attractions = Attraction.all
    end 

    def show 
        if logged_in?
            @attraction = Attraction.find(params[:id])
            @ride = @attraction.rides.build(user_id: current_user.id)
        else 
            redirect_to root_path
        end 
    end 

    private 
        def attraction_params
            params.require(:attractions).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
        end 
end
