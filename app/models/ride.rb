class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
  
    def take_ride
      if user_has_enough_tickets && user_is_tall_enough
        start_ride
      elsif !user_has_enough_tickets && user_is_tall_enough
        "Sorry. " + not_enough_tickets
      elsif user_has_enough_tickets && !user_is_tall_enough
        "Sorry. " + not_tall_enough
      elsif !user_has_enough_tickets && !user_is_tall_enough
        "Sorry. " + not_enough_tickets + " " + not_tall_enough
      end
    end
  
    private
  
    def start_ride
      new_ticket_count = user.tickets - attraction.tickets
      new_nausea = user.nausea + attraction.nausea_rating
      new_happiness = user.happiness + attraction.happiness_rating
  
      self.user.update(
        tickets: new_ticket_count,
        nausea: new_nausea,
        happiness: new_happiness
      )
      "Thanks for riding the #{attraction.name}!"
    end
  
    def user_has_enough_tickets
      return true if user.tickets >= attraction.tickets
    end
  
    def user_is_tall_enough
      return true if user.height >= attraction.min_height
    end
  
    def not_enough_tickets
      "You do not have enough tickets to ride the #{attraction.name}."
    end
  
    def not_tall_enough
      "You are not tall enough to ride the #{attraction.name}."
    end
  
  end