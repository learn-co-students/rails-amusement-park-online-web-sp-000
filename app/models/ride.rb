class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        tall_enough, enough_tickets = meets_requirements
        if tall_enough && enough_tickets
            get_on_the_ride
        elsif !tall_enough && !enough_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." 
        elsif !enough_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !tall_enough
            "Sorry. You are not tall enough to ride the #{attraction.name}." 
        end
    end

    def meets_requirements
        tall_enough = false
        enough_tickets = false
        if user.height > attraction.min_height
            tall_enough = true
        end
        if user.tickets > attraction.tickets
            enough_tickets = true
        end
        return [tall_enough, enough_tickets]
    end

    def get_on_the_ride
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        "Thanks for riding the #{self.attraction.name}!"
    end
end
