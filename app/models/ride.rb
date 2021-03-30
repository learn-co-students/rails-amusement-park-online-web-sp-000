class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction 
    
    def take_ride
        if user_has_enough_tickets && user_is_tall_enough
            start_ride
        elsif user_is_tall_enough && !user_has_enough_tickets
          "Sorry. " + not_enough_tickets
        elsif !user_is_tall_enough && user_has_enough_tickets
          "Sorry. " + not_tall_enough
        elsif !user_is_tall_enough && !user_has_enough_tickets
          "Sorry. " + not_enough_tickets + " " + not_tall_enough
        end
    end
    
    def user_has_enough_tickets
        if self.user.tickets >= self.attraction.tickets
            true
        else 
            false
        end
    end
      
    def user_is_tall_enough 
        
        if self.user.height >= self.attraction.min_height
            true
        else
            false
        end
        
    end
    
    def start_ride
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_ticket_count = self.user.tickets - self.attraction.tickets
        update_hash = {
            :happiness => new_happiness,
            :nausea => new_nausea,
            :tickets => new_ticket_count}
        @user = User.find_by(:id => self.user_id)
        @user.update(update_hash)
        self.user.update(update_hash)
        
        "Thanks for riding the #{self.attraction.name}!"
    end
    
      def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
      end
    
      def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}."
      end
end
