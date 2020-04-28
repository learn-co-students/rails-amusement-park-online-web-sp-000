class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]

    def index
        @attractions = Attraction.all
    end

    def show
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        return redirect_to new_attraction_path unless @attraction.save
        redirect_to attraction_path(@attraction)
    end


    def edit
    end

    def update
        return redirect_to edit_attraction_path unless @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end
end
