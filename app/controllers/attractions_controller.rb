class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def create
        @attraction = Attraction.create(attractions_params)
        redirect_to attraction_path(@attraction)
    end

    def index
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        #@ride = Ride.find_by(attraction_id: @attraction.id)
        @user = User.find_by_id(session[:user_id])
    end

    def update
        #raise params.inspect
        @attraction = Attraction.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        if @user.admin == false
            ride = Ride.create(attraction_id: @attraction.id, user_id: @user.id)
            flash[:notice] = ride.take_ride
            redirect_to user_path(@user)
        else
            @attraction.name = params[:attraction][:name]
            @attraction.happiness_rating = params[:attraction][:happiness_rating]
            @attraction.nausea_rating = params[:attraction][:nausea_rating]
            @attraction.tickets = params[:attraction][:tickets]
            @attraction.min_height = params[:attraction][:min_height]
            @attraction.save
            redirect_to attraction_path(@attraction)
        end
    end

    private
    def attractions_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end