class AttractionsController < ApplicationController
    def index
        @user = User.find_by(id: session[:user_id])
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        render :show
    end

    def ride
        user = User.find_by(id: session[:user_id])
        attraction = Attraction.find_by(id: params[:id])
        ride = Ride.new
        ride.user = user
        ride.attraction = attraction

        flash[:alert] = ride.take_ride

        redirect_to user_path(user)
    end

    def new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction.id)
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)

        redirect_to attraction_path(attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end