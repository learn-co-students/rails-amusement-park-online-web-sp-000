class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all 
    end 

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        if @user.tickets > @attraction.tickets && @user.height > @attraction.min_height
            tickets_left = @user.tickets - @attraction.tickets 
            @user.tickets = tickets_left
            @user.save 

        end 

    end 
end 