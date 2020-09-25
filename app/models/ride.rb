class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
       if user_has_enough_tickets && user_is_tall_enough
        start_ride
       elsif
        user_has_enough_tickets && !user_is_tall_enough
        "Sorry. You are not tall enough to ride the #{attraction.name}."
       elsif
        !user_has_enough_tickets && user_is_tall_enough
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif
            !user_has_enough_tickets && !user_is_tall_enough
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        end
    end

    def user_has_enough_tickets
        self.user.tickets >= self.attraction.tickets
    end

    def user_is_tall_enough
        self.user.height >= self.attraction.min_height
    end

    def start_ride
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_ticket_count = self.user.tickets - self.attraction.tickets
        self.user.update(
          :happiness => new_happiness,
          :nausea => new_nausea,
          :tickets => new_ticket_count
        )
        "Thanks for riding the #{self.attraction.name}!"
      end
  


end
