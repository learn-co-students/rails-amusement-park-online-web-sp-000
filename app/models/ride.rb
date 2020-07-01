class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction 

    def take_ride 
        if !sufficient_tickets? && !sufficient_height?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." 
        elsif !sufficient_tickets?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif  !sufficient_height?
            "Sorry. You are not tall enough to ride the #{attraction.name}." 
        else 
            user.update_attribute(:tickets, user.tickets - attraction.tickets)
            user.update_attribute(:happiness, user.happiness + attraction.happiness_rating)
            user.update_attribute(:nausea, user.nausea + attraction.nausea_rating)
            "Thanks for riding the #{attraction.name}!"
        end
    end 

    def sufficient_tickets? 
        user.tickets >= attraction.tickets
    end 

    def sufficient_height? 
        user.height >= attraction.min_height
    end 
end
