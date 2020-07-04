class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @message = self.message
        if user.height < attraction.min_height || user.tickets < attraction.tickets
            "Sorry. #{@message}"
        else
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
            @message
        end   
    end

    def message
        if user.height < attraction.min_height && user.tickets < attraction.tickets
            "#{need_tickets} #{too_short}"
        elsif user.tickets < attraction.tickets
            need_tickets
        elsif user.height < attraction.min_height
            too_short
        else
            "Thanks for riding the #{attraction.name}!"
        end
    end

    def too_short
        "You are not tall enough to ride the #{attraction.name}."

    end

    def need_tickets
        "You do not have enough tickets to ride the #{attraction.name}."
    end
end
