class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end
    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        new_attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(new_attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        attraction_to_be_edited = Attraction.find(params[:id])
        attraction_to_be_edited.update(attraction_params)
        redirect_to attraction_path(attraction_to_be_edited)
    end

    private
        def attraction_params
            params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
        end

end