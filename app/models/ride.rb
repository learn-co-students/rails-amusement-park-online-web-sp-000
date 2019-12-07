class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user 


    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height 
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." + " You are not tall enough to ride the #{self.attraction.name}." 
        elsif self.user.tickets < self.attraction.tickets 
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." 
        elsif self.user.height < self.attraction.min_height 
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}." 
        else 
            tickets_left = self.user.tickets - self.attraction.tickets 
            self.user.tickets -= tickets_left
            self.user.save

            nausea_level = self.user.nausea - self.attraction.nausea_rating
            self.user.nausea += self.attraction.nausea_rating
            self.user.save
        end 
    end 
end

