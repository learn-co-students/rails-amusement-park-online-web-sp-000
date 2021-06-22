class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = self.user
        attraction = self.attraction
        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
            # byebug
            user.tickets = user.tickets - attraction.tickets
            user.nausea = user.nausea + attraction.nausea_rating
            # byebug
            user.happiness = user.happiness + attraction.happiness_rating
            user.save!  
            puts "the following error was thrown: #{error}"
        elsif user.tickets < attraction.tickets && user.height < attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        end
    end
end
