class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.find_by(id: params[:id])
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name)
    end

end
