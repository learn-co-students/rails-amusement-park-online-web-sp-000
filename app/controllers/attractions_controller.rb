class AttractionsController < ApplicationController

    def index 
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction)
    end

    def edit
        @attr = Attraction.find_by(id: params[:id])
    end 

    def update
        @attr = Attraction.find_by(id: params[:id])
        @attr.update(attraction_params)
        redirect_to attraction_path(@attr)
    end

    def show
        @attr = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        if params[:ride]
            ride = Ride.create(ride_params)
            flash[:alert] = ride.take_ride
            redirect_to user_path(@user)
        end
    end

    private 
    
    def ride_params 

        params = { 
            name: @attr.name, 
            min_height: @attr.min_height, 
            nausea_rating: @attr.nausea_rating, 
            happiness_rating: @attr.happiness_rating, 
            tickets: @attr.tickets,
            user: @user,
            attraction: @attr
        }
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
