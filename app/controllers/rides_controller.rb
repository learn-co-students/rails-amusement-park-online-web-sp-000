require 'pry'
class RidesController < ApplicationController

    def new
        @ride = Ride.new 
    end 

    def create 
        if !params[:ride][:attraction_id].nil? || !params[:ride][:attraction_id] != "" && !params[:ride][:user_id].nil? || !params[:ride][:user_id] != "" 
            @ride = Ride.create(ride_params) 
            @user = User.find_by(id: params[:ride][:user_id])
            @attraction = Attraction.find_by(id: params[:ride][:attraction_id])
    
            if @user.tickets > @attraction.tickets
                tickets_left = @user.tickets - @attraction.tickets 
                @user.tickets = tickets_left
                @user.save 
                redirect_to user_path(@ride.user)
            end
        end 
    end 




    private 

    def ride_params
        params.require(:ride).permit(:attraction_id, :user_id)
    end 

end 