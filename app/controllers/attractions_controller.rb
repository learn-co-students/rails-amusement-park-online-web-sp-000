class AttractionsController < ApplicationController 

    def index
        @attractions = Attraction.all 
        @user = current_user
        #binding.pry
    end

    def show 
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end


end