class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all 
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.new(attraction_id: @attraction_id, user_id: current_user.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def ride
        ride = Ride.create(ride_params)
        ride.take_ride
        flash[:message] = ride.message
        redirect_to user_path(ride.user.id)
    end

private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end