class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.name = params[:attraction][:name]
        @attraction.min_height = params[:attraction][:min_height]
        @attraction.happiness_rating = params[:attraction][:happiness_rating]
        @attraction.nausea_rating = params[:attraction][:nausea_rating]
        @attraction.tickets = params[:attraction][:tickets]
        @attraction.save
        redirect_to attraction_path(@attraction)
    end

end