class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
        ride = Ride.create(user_id: @user.id, attraction_id: params[:id])
        ride.take_ride  

        if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
            flash[:tickets] = "You do not have enough tickets to ride the #{@attraction.name}" 
            flash[:height] = "You are not tall enough to ride the #{@attraction.name}" 
        elsif @user.height < @attraction.min_height
            flash[:height] = "You are not tall enough to ride the #{@attraction.name}"
        elsif @user.tickets < @attraction.tickets    
            flash[:tickets] = "You do not have enough tickets to ride the #{@attraction.name}"
        else
            flash[:thanks] = "Thanks for riding the #{@attraction.name}!"    
        end          
    end

end
