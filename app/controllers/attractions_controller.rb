class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @user = User.find_by(id: session[:user_id])
    end

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.new
        @user = User.find_by(id: session[:user_id])
    end

    def new 
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.create(att_params)

        redirect_to attraction_path(@attraction)
    end

    def edit 
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(att_params)
        @attraction.save 
        
        redirect_to attraction_path
    end

    private 

    def att_params
        params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :height)
    end


end
