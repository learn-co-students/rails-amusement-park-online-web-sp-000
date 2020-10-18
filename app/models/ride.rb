class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height >  self.user.height
            message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.attraction.tickets > self.user.tickets 
            message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height >  self.user.height
            message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."     
        else 
            self.user.update(tickets: self.user.tickets -= self.attraction.tickets, nausea: self.user.nausea + self.attraction.nausea_rating, happiness: self.user.happiness + self.attraction.happiness_rating)
            
            message = "Thanks for riding the #{attraction.name}!"
        end 
    end
end
