class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user


    def take_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height 
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif self.user.tickets < self.attraction.tickets 
            "Sorry. You do not have enough tickets to ride the Roller Coaster."
        elsif self.user.height < self.attraction.min_height 
            "Sorry. You are not tall enough to ride the Roller Coaster."
        else 
            self.user.update(:tickets => self.user.tickets - self.attraction.tickets)
            self.user.update(:nausea => self.user.nausea + self.attraction.nausea_rating)
            self.user.update(:happiness => self.user.happiness + self.attraction.happiness_rating)
            "Thanks for riding the #{self.attraction.name}!"

        end 
    end

    def user_meets_requirements
        if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

end
