class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def new
        @user = User.find(session[:user_id])
        @attraction = Attraction.new
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
    end

    def edit
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction)
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
