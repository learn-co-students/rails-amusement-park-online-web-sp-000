class AttractionsController < ApplicationController
before_action :require_admin, except: [:index, :show]

def index
    if current_user.admin?
        @verb = "Show"
    else
        @verb = "Go on"
    end
end


def show
    @attraction = Attraction.find(params[:id])
end

def new
    @attraction = Attraction.new
end

def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
        redirect_to attraction_path(@attraction)
    else
        redirect_to new_attraction_path
    end
end

def edit
    @attraction = Attraction.find(params[:id])
end

def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
end


private

def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
end

def require_admin
    current_user.admin?
end



end
