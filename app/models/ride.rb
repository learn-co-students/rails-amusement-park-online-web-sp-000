class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if not_qualified_period
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif not_tall_enough
             "Sorry. You are not tall enough to ride the #{attraction.name}."
        else 
            update_tickets 
            update_nausea
            update_happiness
            user.save
            "Thanks for riding the #{attraction.name}!"
       end
    end

    private

    def not_qualified_period
        self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
    end

    def not_enough_tickets
        self.user.tickets < self.attraction.tickets 
    end

    def not_tall_enough
        self.user.height < self.attraction.min_height 
    end

    def update_tickets
        self.user.tickets = self.user.tickets - self.attraction.tickets
    end

    def update_nausea
        self.user.nausea = self.user.nausea + self.attraction.nausea_rating
    end

    def update_happiness
        self.user.happiness = self.user.happiness + self.attraction.happiness_rating
    end

end
