class AttractionsController < ApplicationController
    def welcome
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to @attraction
    end
    def index
        @user = current_user
        @attractions = Attraction.all 
    end
    def show
        @user = current_user
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: @user.id)
    end
    def edit
        @user = current_user
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update 
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to @attraction
    end 
    private
  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

end
