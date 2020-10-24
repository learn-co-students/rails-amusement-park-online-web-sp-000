class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if (self.user.height >= self.attraction.min_height) && (self.user.tickets >= self.attraction.tickets)
            ride_ride
            "Thanks for riding the #{self.attraction.name}!"
        elsif (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets)#too short AND no tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif (self.user.height < self.attraction.min_height) && (self.user.tickets >= self.attraction.tickets) #hieght is less the ride hieght
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets && (self.user.height >= self.attraction.min_height) #does not have enough tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
    end


    def ride_ride
        self.user.tickets = self.user.tickets - self.attraction.tickets
        self.user.happiness = self.user.happiness + self.attraction.happiness_rating
        self.user.nausea =  self.user.nausea + self.attraction.nausea_rating
        self.user.save
    end
end