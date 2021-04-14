class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.user.tickets < self.attraction.tickets && user.height < self.attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        
        else
            updated_ticket_count = self.user.tickets - self.attraction.tickets
            updated_nausea = self.user.nausea + self.attraction.nausea_rating
            updated_happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(
                tickets: updated_ticket_count,
                nausea: updated_nausea,
                happiness: updated_happiness
            )
        end
    end
end
