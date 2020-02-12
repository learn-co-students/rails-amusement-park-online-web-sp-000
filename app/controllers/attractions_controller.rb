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

    def new
        if !current_user.admin
            redirect_to '/'
        else
            @attraction = Attraction.new
        end
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def edit
        if !current_user.admin
            redirect_to '/'
        else
            @attraction = Attraction.find(params[:id])
        end
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end
    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
end
