class AttractionsController < ApplicationController 
    def new
        @attraction = Attraction.new
    end 

    def index 
        @attractions = Attraction.all
        if User.find(session[:user_id]).admin
            @admin = true
        end
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end 

    def show 
        @attraction = Attraction.find(params[:id])
        if User.find(session[:user_id]).admin
            @admin = true
        end
    end 

    def edit 
        @attraction = Attraction.find(params[:id])
    end 

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path
    end

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)        
    end
end 