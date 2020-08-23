class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def ride
        msg =[]
        if user.tickets <= attraction.tickets
            msg << "You do not have enough tickets to ride the #{attraction.name}"
        end
        if user.height <= attraction.min_height
            msg << "You are not tall enough to ride the #{attraction.name}"
        end
        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
            user.tickets -= attraction.tickets
            user.happiness += attraction.happiness_rating
            user.nausea += attraction.nausea_rating
            user.save
            msg << "Wooo! Wasn't that AWESOME! Thanks for riding the #{attraction.name}!"
        end
        msg.join(" ")
    end

    def ticket_check

    end

    def height_check

    end
end
