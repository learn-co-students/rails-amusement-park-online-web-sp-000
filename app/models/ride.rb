class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        rider = self.user
        attraction = self.attraction
        if rider.tickets < attraction.tickets && rider.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif rider.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif rider.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            rider.tickets = rider.tickets - attraction.tickets
            rider.nausea += attraction.nausea_rating
            rider.happiness += attraction.happiness_rating
            rider.save 
        end

        
    end
end
