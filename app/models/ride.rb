class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        return "Sorry. You do not have enough tickets to ride the #{coaster.name}. You are not tall enough to ride the #{coaster.name}." if !self.tall_enough && !self.enough_tickets

        return "Sorry. You do not have enough tickets to ride the #{coaster.name}." unless self.enough_tickets
        
        return "Sorry. You are not tall enough to ride the #{coaster.name}." unless self.tall_enough
        
        self.update_tickets
        self.update_nausea
        self.update_happiness
    end
    
    def enough_tickets
        true if rider.tickets >= coaster.tickets
    end
    
    def tall_enough
        true if rider.height >= coaster.min_height
    end
    
    def update_tickets
        rider.update_column(:tickets, rider.tickets -= coaster.tickets)
    end

    def update_nausea
        rider.update_column(:nausea, rider.nausea += coaster.nausea_rating)
    end

    def update_happiness
        rider.update_column(:happiness, rider.happiness += coaster.happiness_rating)
    end

    def rider 
        self.user
    end

    def coaster
        self.attraction
    end
end
