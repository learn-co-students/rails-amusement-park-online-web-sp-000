class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = self.user
        attraction = self.attraction
        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
            user.tickets = user.tickets - attraction.tickets
            user.nausea = user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating
            user.save
            # byebug
            # tickets_left = user.tickets - attraction.tickets
            # new_nausea = user.nausea + attraction.nausea_rating
            # # byebug
            # new_happiness = user.happiness + attraction.happiness_rating
            # explicitly return tickets_left, new_nausea, new_happiness?
            # byebug
            # user.save!
            # user.update(happiness: new_happiness, nausea: new_nausea, tickets: tickets_left)
        elsif user.tickets < attraction.tickets && user.height < attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        end
    end
end
