class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the Roller Coaster."
        elsif user.height < attraction.height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        end

    end
end
