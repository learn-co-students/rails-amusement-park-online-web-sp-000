class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end
    
    def show
        @attraction = Attraction.find(params[:id])
    end

    def ride
        @attraction = Attraction.find(params[:attraction_id])
        @user = User.find(params[:user_id])
        @ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
        flash[:alert] = @ride.take_ride
        redirect_to user_path(@user)
    end
end