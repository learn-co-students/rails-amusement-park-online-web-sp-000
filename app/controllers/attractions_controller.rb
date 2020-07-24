class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
        ride = Ride.create(user_id: @user.id, attraction_id: params[:id])
        ride.take_ride                
    end

end
