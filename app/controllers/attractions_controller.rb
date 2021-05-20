class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)

        if @attraction.save
          redirect_to @attraction
        else
          render :new
        end
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)

        redirect_to @attraction
    end

    def destroy
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end
