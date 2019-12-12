class AttractionsController < ApplicationController
    before_action :current_user, only: [:show,:edit]
    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attractions_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def show
        @attraction = Attraction.find_by :id=>params[:id]
        if @attraction
        @ride = @attraction.rides.build(user_id: @user.id)
        end
    end

    def edit
      
        @attraction = Attraction.find_by :id=>params[:id]
    end

    def update
       
        @attraction = Attraction.find_by :id=>params[:id]
        @attraction.update(attractions_params)
        redirect_to attraction_path(@attraction)
    end

    private
    def attractions_params
        params.require(:attraction).permit(:name,:min_height,:happiness_rating,:nausea_rating,:tickets)
    end
end
