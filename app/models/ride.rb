class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        # user = self.user
        user = self.user
        attraction = self.attraction

        explanations = []
        if (user.tickets < attraction.tickets)
            explanations << "You do not have enough tickets to ride the #{attraction.name}."
        end

        if (user.height < attraction.min_height)
            explanations << "You are not tall enough to ride the #{attraction.name}."
        end

        unless explanations.empty?
            message = "Sorry."
            explanations.each do |explanation|
                message += (" " + explanation)
            end
            message
        else

        user.tickets -= attraction.tickets

        user.nausea += attraction.nausea_rating

        user.happiness += attraction.happiness_rating
        user.save
        message = "Thanks for riding the #{attraction.name}!"
        end
        message
    end




end
