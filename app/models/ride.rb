class Ride < ApplicationRecord
    belongs_to :user 
    belongs_to :attraction

 
    def take_ride
        #ride belongs to user @ride.user 
        #ride belongs to attraction @ride.attraction 
        
        if !enough_tickets? && !tall_enough?
            msg_ticket + " " + msg_height

        elsif  !enough_tickets?
            msg_ticket
        elsif !tall_enough?
            "Sorry. " + msg_height

        else 
            update_user
        end

    end 

    def enough_tickets?
        self.user.tickets >= self.attraction.tickets
    end 

    def tall_enough?
        self.user.height >= self.attraction.min_height
    end 

    def msg_height
        "You are not tall enough to ride the #{self.attraction.name}." 
    end 

    def msg_ticket
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end 

    def update_user 
         
        self.user.tickets -= self.attraction.tickets 
        self.user.nausea += self.attraction.nausea_rating
        self.user.happiness += self.attraction.happiness_rating
        self.user.save

    end 

end
