class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
    

    def take_ride
        if self.need_tickets_and_height?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif need_height?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif need_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        else
            self.user_status
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

    def need_tickets_and_height?
        self.need_tickets? && self.need_height?
    end

    def need_tickets?
        self.user.tickets < self.attraction.tickets
    end

    def need_height?
        self.user.height < self.attraction.min_height
    end

    def user_status
        self.user.tickets -= self.attraction.tickets
        self.user.happiness += self.attraction.happiness_rating
        self.user.nausea += self.attraction.nausea_rating
        self.user.save
    end
end
