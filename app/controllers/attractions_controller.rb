class AttractionsController < ApplicationController

    def new
    end

    def create

        @attraction = Attraction.create(name: params[:attraction][:name], tickets: params[:attraction][:tickets], nausea_rating: params[:attraction][:nausea_rating], happiness_rating: params[:attraction][:happiness_rating], min_height: params[:attraction][:min_height])

        if @attraction
            redirect_to attraction_path(@attraction) 
        else
            redirect_to controller: 'attractions', action: 'new'
        end
    end

    def index
        @user = User.find(session[:user_id])
        @attractions = Attraction.all
    end

    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
        ride = Ride.create(user_id: @user.id, attraction_id: params[:id])

        if !@user.admin
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

end
