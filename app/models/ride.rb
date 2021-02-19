class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        # byebug
        x=user.tickets - attraction.tickets
        user.happiness = attraction.happiness_rating
        user.nausea = attraction.nausea_rating
        user.update(:tickets => x, :happiness => attraction.happiness_rating, :nausea => attraction.nausea_rating)

        # byebug
    end
end
