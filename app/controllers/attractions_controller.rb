class AttractionsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @atrs = Attraction.all
    end

    def show
        @atr = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
    end

    def new
        @atr = Attraction.new
    end

    def create
        @atr = Attraction.create(atr_params)
        redirect_to attraction_path(@atr)
    end

    def edit
        @atr = Attraction.find(params[:id])
    end

    def update
        @atr = Attraction.find(params[:id]).update(atr_params)
        redirect_to attraction_path(params[:id])
    end

    private

    def atr_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end
