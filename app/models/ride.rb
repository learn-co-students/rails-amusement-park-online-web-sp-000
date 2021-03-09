class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user


    def take_ride
        trac = Attraction.find(attraction_id)
        user = User.find(user_id)
        if (trac.tickets > user.tickets && trac.min_height > user.height)
            return ("Sorry. You do not have enough tickets to ride the #{trac.name}. You are not tall enough to ride the #{trac.name}.")
        elsif (trac.tickets > user.tickets)
            return ("Sorry. You do not have enough tickets to ride the #{trac.name}.")
        elsif (trac.min_height > user.height)
            return ("Sorry. You are not tall enough to ride the #{trac.name}.")
        else
            tiks = user.tickets - trac.tickets
            happy = user.happiness + trac.happiness_rating
            puke = user.nausea + trac.nausea_rating
            user.update(tickets: tiks, happiness: happy, nausea: puke)
            ride = Ride.find_or_create_by(user_id: user_id, attraction_id: attraction_id)
            return ride
        end
    end
             
end
