class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !has_tickets? && !has_height?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif !has_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif !has_height?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            self.user.update(tickets: balance_tickets, nausea: new_nausea, happiness: new_happiness)
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

    private
    def has_tickets?
        self.user.tickets >= self.attraction.tickets
    end

    def has_height?
        self.user.height >= self.attraction.min_height
    end

    def balance_tickets
        self.user.tickets - self.attraction.tickets
    end

    def new_nausea
        self.user.nausea + self.attraction.nausea_rating
    end

    def new_happiness
        self.user.happiness + self.attraction.happiness_rating
    end
end
