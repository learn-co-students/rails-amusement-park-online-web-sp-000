class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = User.find(self.user.id)
        if user.tickets < self.attraction.tickets && user.height < self.attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            user.tickets -= self.attraction.tickets
            user.nausea += self.attraction.nausea_rating
            user.happiness += self.attraction.happiness_rating
            user.save
            "Thanks for riding the #{self.attraction.name}!"
        end
    end
    
end
