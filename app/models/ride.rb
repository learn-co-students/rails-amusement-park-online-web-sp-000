class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if too_poor && too_short
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif too_poor
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif too_short
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else 
            start_ride
        end 
    end 

    def too_short 
        self.user.height < self.attraction.min_height 
    end 

    def too_poor
        self.user.tickets < self.attraction.tickets 
    end 

    def start_ride 
        new_ticket_count = self.user.tickets - self.attraction.tickets 
        new_nausea = self.user.nausea + self.attraction.nausea_rating 
        new_happiness = self.user.happiness + self.attraction.happiness_rating 

        self.user.update(:tickets => new_ticket_count, :nausea => new_nausea, :happiness => new_happiness)
        user = User.find_by_id(self.user_id)
        user.update(:tickets => new_ticket_count, :nausea => new_nausea, :happiness => new_happiness)

        "Thanks for riding the #{self.attraction.name}!"
    end 
end
