class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    def ride
        @attraction = Attraction.find(params[:id])
        user_id = session[:user_id]
        session[:ride_message] = @attraction.rides.build(user_id: user_id).take_ride
        redirect_to user_path(user_id)
    end

    def new
        redirect_to root_path unless current_user.admin
        @attraction = Attraction.new
    end

    def create
        redirect_to root_path unless current_user.admin
        if @attraction = Attraction.new(attraction_params)
            @attraction.save
            redirect_to attraction_path(@attraction)
        end
    end

    def edit
        redirect_to root_path unless current_user.admin
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        redirect_to root_path unless current_user.admin
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end
