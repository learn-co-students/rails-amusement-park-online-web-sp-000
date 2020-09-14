class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    # validates :user_id, presence: true
    # validates :attraction_id, presence: true

    def take_ride
        usr = self.user
        attract = self.attraction

        if usr.tickets < attract.tickets && usr.height < attract.min_height
            "Sorry. You do not have enough tickets to ride the #{attract.name}. You are not tall enough to ride the #{attract.name}."
        elsif usr.tickets < attract.tickets
            "Sorry. You do not have enough tickets to ride the #{attract.name}."
        elsif usr.height < attract.min_height
            "Sorry. You are not tall enough to ride the #{attract.name}."
        else
            # usr.tickets = usr.tickets - attract.tickets
            # usr.nausea = usr.nausea + attract.nausea_rating
            # usr.happiness = usr.happiness + attract.happiness_rating
            # usr.save
            usr.update(tickets: usr.tickets - attract.tickets, nausea: usr.nausea + attract.nausea_rating, happiness: usr.happiness + attract.happiness_rating)
            "Thanks for riding the #{attract.name}!"
        end
    end
end
