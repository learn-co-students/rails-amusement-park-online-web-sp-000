require 'pry'

class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif self.attraction.min_height > self.user.height 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            self.user.tickets -= self.attraction.tickets
            self.user.happiness += self.attraction.happiness_rating 
            self.user.nausea += self.attraction.nausea_rating
            self.user.save
            "Thanks for riding the #{attraction.name}!"
        end
    end
    
end
