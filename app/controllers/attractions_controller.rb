class AttractionsController < ApplicationController 

    def index
        @attractions = Attraction.all 
        @user = current_user
        #binding.pry
    end

    def show 
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end

    def new 
        @attraction = Attraction.new 
    end

    def create 
        @attraction = Attraction.create(user_params)
        redirect_to attraction_path(@attraction)
    end

    def edit 
        @attraction = Attraction.find(params[:id])
    end

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(user_params)
        redirect_to attraction_path(@attraction)
    end

    private 
    
    def user_params 
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end

end