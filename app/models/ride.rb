class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !enough_tickets_to_ride? || !tall_enough_to_ride?
            apology_message
        else
            take_tickets
            update_user_happiness
            update_user_nausea
            self.user.save
        end
    end

    def take_tickets
        self.user.tickets -= self.attraction.tickets
    end

    def update_user_happiness
        self.user.happiness += self.attraction.happiness_rating
    end

    def update_user_nausea
        self.user.nausea += self.attraction.nausea_rating
    end

    def enough_tickets_to_ride?
        self.user.tickets >= self.attraction.tickets
    end

    def tall_enough_to_ride?
        self.user.height >= self.attraction.min_height
    end

    def attraction_name
        self.attraction.name
    end

    def user_name
        self.user_name
    end

    def apology_message
        message = "Sorry."
        message << " You do not have enough tickets to ride the #{self.attraction_name}." if !enough_tickets_to_ride?
        message << " You are not tall enough to ride the #{self.attraction_name}." if !tall_enough_to_ride?
        message
    end
end
