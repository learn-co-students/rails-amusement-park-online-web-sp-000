class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        messages = []
        if self.attraction.tickets > self.user.tickets || self.user.height < self.attraction.min_height
            if self.user.tickets < self.attraction.tickets
                messages << "You do not have enough tickets to ride the #{attraction.name}."
            end
            if self.user.height < self.attraction.min_height
                messages << "You are not tall enough to ride the #{self.attraction.name}."
            end
        else
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.tickets -= self.attraction.tickets
            self.user.save
            messages << "Thanks for riding the #{self.attraction.name}!"
        end
        if messages[0].start_with?("T")
            messages.join(" ")
        else
            "Sorry. " + messages.join(" ")
        end
    end
end