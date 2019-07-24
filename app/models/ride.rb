class Ride < ApplicationRecord
    belongs_to :user 
    belongs_to :attraction

 
    def take_ride
        #ride belongs to user @ride.user 
        #ride belongs to attraction @ride.attraction 
        
 
        
                if !enough_tickets? &&  !min_height?
                    "Sorry. " + not_enough_tickets_msg + " " + not_tall_enough_msg 
                elsif  !min_height?
                    "Sorry. " + not_tall_enough_msg 
                elsif  !enough_tickets?
                    "Sorry. " + not_enough_tickets_msg
                 else
                    self.user.tickets -=  self.attraction.tickets
                    self.user.nausea +=  self.attraction.nausea_rating
                    self.user.happiness +=  self.attraction.happiness_rating
                    self.user.save
                    "Thanks for riding the #{ self.attraction.name}!"
                end
    end 

    def enough_tickets?
        self.user.tickets >= self.attraction.tickets 
    end 

    def min_height?
        self.user.height >=self.attraction.min_height 
    end 

    def not_tall_enough_msg
        "You are not tall enough to ride the #{ self.attraction.name}."
    end 

    def not_enough_tickets_msg
        "You do not have enough tickets to ride the #{ self.attraction.name}."
    end 
end
