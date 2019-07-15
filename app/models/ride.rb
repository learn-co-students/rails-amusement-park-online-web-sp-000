class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        msg = "Sorry."
        if self.user.tickets < self.attraction.tickets
            msg +=" You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if self.user.height < self.attraction.min_height
            msg +=" You are not tall enough to ride the #{self.attraction.name}."
        end
        if msg != "Sorry."
            return msg
        else
            self.user.tickets -=self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            return nil
        end
    end
end
