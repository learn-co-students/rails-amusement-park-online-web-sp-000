class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        return "Sorry. You do not have enough tickets to ride the #{coaster.name}. You are not tall enough to ride the #{coaster.name}." if !tall_enough && !enough_tickets

        return "Sorry. You do not have enough tickets to ride the Roller Coaster." unless enough_tickets
        
        return "Sorry. You are not tall enough to ride the #{coaster.name}." unless tall_enough

        update_tickets
        update_nausea
        update_happiness
    end

    def enough_tickets
        true if rider.tickets >= coaster.tickets
    end

    def tall_enough
        true if rider.height >= coaster.min_height
    end

    def update_tickets
        rider.tickets -= coaster.tickets
        rider.save
    end

    def update_nausea
        rider.nausea += coaster.nausea_rating
        rider.save
    end

    def update_happiness
        rider.happiness += coaster.happiness_rating
        rider.save
    end

    def rider 
        self.user
    end

    def coaster
        self.attraction
    end
end
