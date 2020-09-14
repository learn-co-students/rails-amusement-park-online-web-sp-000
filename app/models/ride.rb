class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        # to keep code DRY, set some variables to use
        attraction = self.attraction
        user = self.user
        if (attraction.tickets > user.tickets) && (attraction.min_height > user.height)
            message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif attraction.min_height > user.height
            message = "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            user.update(tickets: user.tickets - attraction.tickets)
            user.update(nausea: user.nausea + attraction.nausea_rating)
            user.update(happiness: user.happiness + attraction.happiness_rating)
            "Thanks for riding the #{attraction.name}!"
        end
    end
end