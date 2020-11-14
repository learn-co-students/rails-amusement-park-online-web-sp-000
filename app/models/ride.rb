class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if enough_tickets? && tall_enough?   
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif tall_enough?
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            user_update
            "Thanks for riding the #{self.attraction.name}!"
        end
    end

    def tall_enough?
        self.user.height < self.attraction.min_height ? true : false
    end

    def enough_tickets?
        self.user.tickets < self.attraction.tickets ? true : false
    end

    def user_update
        self.user.happiness += self.attraction.happiness_rating
        self.user.tickets -= self.attraction.tickets
        self.user.nausea += self.attraction.nausea_rating
        self.user.save
        "Thanks for riding the #{self.attraction.name}!"
    end


end
