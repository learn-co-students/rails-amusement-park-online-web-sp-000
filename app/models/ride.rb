class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if not_enough_tickets && not_tall_enough
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif not_tall_enough
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
        end
    end

    private 

    def not_enough_tickets
        self.attraction.tickets > self.user.tickets
    end 

    def not_tall_enough
        self.attraction.min_height > self.user.height
    end

end
