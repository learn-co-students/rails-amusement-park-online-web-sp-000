class Ride < ActiveRecord::Base
    attr_accessor :tickets, :nausea, :happiness
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = User.find_by_id(self.user_id)
        attraction = Attraction.find_by_id(self.attraction_id)

        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else 
            tickets = user.tickets - attraction.tickets
            happiness = user.happiness + attraction.happiness_rating
            nausea = user.nausea + attraction.nausea_rating
            user.update(tickets: tickets, happiness: happiness, nausea: nausea)
            "Thanks for riding the #{attraction.name}!"
        end
    end


end
