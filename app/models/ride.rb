class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            "Sorry. " + not_enough_tickets + " " + not_tall_enough
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. " + not_enough_tickets
        elsif self.user.height < self.attraction.min_height
            "Sorry. " + not_tall_enough
        else
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating
            user.save
            "Thanks for riding the #{attraction.name}!"

        end  
    end


    def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}."
    end

    def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end

end
