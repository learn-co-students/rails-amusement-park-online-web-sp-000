class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user_tickets < attraction_tickets && self.user.height < self.attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif user_tickets < attraction_tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            subtract_tickets
            add_nausea
            add_happiness
            self.user.save
        end
    end

    def subtract_tickets
        after_ride_tickets = self.user.tickets - self.attraction.tickets
        self.user.tickets = after_ride_tickets
    end

    def add_nausea
        new_nausea_number = self.user.nausea + self.attraction.nausea_rating
        self.user.nausea = new_nausea_number
    end

    def add_happiness
        new_happiness_rating = self.user.happiness + self.attraction.happiness_rating
        self.user.happiness = new_happiness_rating
    end

    def user_tickets
        self.user.tickets
    end
    def attraction_tickets
        self.attraction.tickets        
    end

end
