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
    
            if @user.tickets > @attraction.tickets && @user.height > @attraction.min_height       
                tickets_left = @user.tickets - @attraction.tickets 
                    @user.tickets = tickets_left

                    happiness = @user.happiness + @attraction.happiness_rating
                    @user.happiness = happiness
                    nausea = @user.nausea + @attraction.nausea_rating
                    @user.nausea = nausea 
                    @user.save 
                    redirect_to user_path(@ride.user), notice: "Thanks for riding the #{@attraction.name}!"
                
            elsif @user.tickets < @attraction.tickets && @user.height < @attraction.min_height 
                    redirect_to user_path(@ride.user), notice: "You are not tall enough to ride the #{@attraction.name}. You do not have enough tickets to ride the #{@attraction.name}"     
            elsif  @user.height < @attraction.min_height
                    redirect_to user_path(@ride.user), notice: "You are not tall enough to ride the #{@attraction.name}"
            elsif @user.tickets < @attraction.tickets
                redirect_to user_path(@ride.user), notice: "You do not have enough tickets to ride the #{@attraction.name}"
            end
            
        end 
    end 




    private 

    def ride_params
        params.require(:ride).permit(:attraction_id, :user_id)
    end 

end 