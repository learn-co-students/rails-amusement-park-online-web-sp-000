class Ride < ActiveRecord::Base

    belongs_to :attraction
    belongs_to :user

    validates :user_id, presence: true
    validates :attraction_id, presence: true
    
    def take_ride
        attraction = self.attraction
        user = self.user
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.attraction.tickets > self.user.tickets 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.attraction.min_height > self.user.height 
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            self.user.update(tickets: self.user.tickets - self.attraction.tickets, nausea: self.user.nausea + self.attraction.nausea_rating, happiness: self.user.happiness + self.attraction.happiness_rating)
            "Thanks for riding the #{attraction.name}!"
        end
    end

end
