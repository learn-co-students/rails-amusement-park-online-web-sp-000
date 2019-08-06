class RidesController < ApplicationController

    def create
        ride = Ride.new(user: current_user, attraction_id: params[:attraction][:id])
        message = ride.take_ride
        flash[:message] = message
        @display_message = flash[:message]
    
        redirect_to user_path(ride.user)  #{ message:message }

      end
    
     


        
    

    # def create 
    #     ride = Ride.new(user: current_user, attraction_id: params[:attraction][:id])
       
    #         ride.take_ride
    #         binding.pry
    #         ride.save
    #         flash[:message] = "Thanks for riding the #{ride.attraction.name}!"
    #         redirect_to user_path(ride.user)
        
    # end
     
end 