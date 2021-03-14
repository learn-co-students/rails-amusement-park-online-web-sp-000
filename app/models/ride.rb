class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user

    def take_ride
        out_message = ""
        if(self.user.tickets < self.attraction.tickets)
            out_message << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
            if (self.user.height < self.attraction.min_height)
                out_message << " You are not tall enough to ride the #{self.attraction.name}." 
            end
            return out_message
        elsif (self.user.height < self.attraction.min_height)
            out_message << "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            return out_message     
        else
            self.user.tickets = self.user.tickets - self.attraction.tickets
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            out_message = "Thanks for riding the #{self.attraction.name}!"
            self.save
        end
        return out_message  
    end

end
