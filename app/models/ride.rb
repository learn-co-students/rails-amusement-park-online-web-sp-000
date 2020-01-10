class Ride < ActiveRecord::Base
    belongs_to :attraction 
    belongs_to :user

    def take_ride
        if self.user_tickets < self.attraction_tickets && self.user_height < self.attraction_min_height
          "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.user_tickets < self.attraction_tickets
          "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif self.user_height < self.attraction_min_height
          "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
          self.user.tickets -= self.attraction_tickets
          self.user.nausea += self.attraction_nausea_rating
          self.user.happiness += self.attraction_happiness_rating
          self.user.save
          "Thanks for riding the #{self.attraction.name}!"
    
        end
    end
    
    def user_height
        self.try(:user).try(:height)
    end
    
    def user_tickets
        self.try(:user).try(:tickets)
    end
    
    def attraction_min_height
        self.try(:attraction).try(:min_height)
    end
    
    def attraction_tickets
        self.try(:attraction).try(:tickets)
    end
    
    def user_nausea
        self.try(:user).try(:nausea)
    end
    
    def attraction_nausea_rating
        self.try(:attraction).try(:nausea_rating)
    end
    
    def user_happiness
        self.try(:user).try(:happiness)
    end
    
    def attraction_happiness_rating
        self.try(:attraction).try(:happiness_rating)
    end

end
