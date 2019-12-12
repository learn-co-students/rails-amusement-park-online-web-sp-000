class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
      if !self.tall_enough? && !self.enough_tickets?
        "Sorry. "+ self.not_enough_ticket + " " + self.not_enough_height
      elsif !self.tall_enough? && self.enough_tickets?
        "Sorry. " + self.not_enough_height
      elsif self.tall_enough? && !self.enough_tickets?
        "Sorry. " + self.not_enough_ticket
      else
        start_ride
      end
    end

    def start_ride
      if self.tall_enough? && self.enough_tickets?
        self.user.tickets = self.user.tickets - self.attraction.tickets
        self.user.nausea = self.user.nausea + self.attraction.nausea_rating
        self.user.happiness = self.user.happiness + self.attraction.happiness_rating
        self.user.save
      end
    end   
        
    def tall_enough?
       self.user.height >= self.attraction.min_height
    end

    def enough_tickets?
       self.user.tickets >= self.attraction.tickets
    end

    def not_enough_height
       "You are not tall enough to ride the #{self.attraction.name}."
    end

    def not_enough_ticket
       "You do not have enough tickets to ride the #{attraction.name}."
    end
end
