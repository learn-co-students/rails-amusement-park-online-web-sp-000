class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."   
        elsif user.height < attraction.min_height
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            take_the_ride
            return "Thanks for riding the #{attraction.name}!"
        end
    end

    def take_the_ride
        user.happiness += attraction.happiness_rating
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating

        user.update_attribute(:happiness, user.happiness)
        user.update_attribute(:tickets, user.tickets)
        user.update_attribute(:nausea, user.nausea)
    end

end
