class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        msg =[]
        if ticket_check
            if height_check
                msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
            else
                msg << "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            end 
        
        elsif height_check
            msg << "Sorry. You are not tall enough to ride the #{attraction.name}."

        elsif !ticket_check && !height_check
            user.tickets -= attraction.tickets
            user.happiness += attraction.happiness_rating
            user.nausea += attraction.nausea_rating
            user.save
            msg << "Wooo! Wasn't that AWESOME! Thanks for riding the #{attraction.name}!"
        end
        msg.join(" ")
    end

    def ticket_check
        user.tickets <= attraction.tickets
    end

    def height_check
        user.height <= attraction.min_height
    end
end
