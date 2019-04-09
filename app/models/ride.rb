class Ride < ApplicationRecord
 
    belongs_to :user 
    belongs_to :attraction

    def take_ride
        
        @user = User.find(params[:id])
        
        if @user.tickets < Attraction.tickets 
           return "Sorry. You do not have enough tickets to ride the #{attraction.name}. " 
        end
    end
end
