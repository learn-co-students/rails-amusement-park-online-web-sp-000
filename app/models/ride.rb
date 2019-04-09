class Ride < ApplicationRecord
 
    belongs_to :user 
    belongs_to :attraction

    def take_ride
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."  
        elsif
            user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif
            user.tickets < attraction.tickets 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}." 

        else
            update_tkt = user.tickets - attraction.tickets
            update_nausea = user.nausea + attraction.nausea_rating
            update_happy = user.happiness + attraction.happiness_rating

            user.update(tickets: update_tkt, nausea: update_nausea, happiness: update_happy)
        end  
    end
end
