class AttractionsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @attractions = Attraction.all
    end

    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        if(attraction = Attraction.create(attraction_params))
            redirect_to attraction_path(attraction)
        else
            render 'new'
        end
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        attraction = Attraction.find(params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end

    private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end
end