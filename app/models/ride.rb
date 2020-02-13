class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        # accounts for user not having enough tickets
        # if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
        #     return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        # elsif self.attraction.min_height > self.user.height
        #     return "Sorry. You are not tall enough to ride the Roller Coaster."
        # else
        #     return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        # end
        # updates user's happiness, nausea

        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
             return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        end

    
        if self.attraction.tickets > self.user.tickets 
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        end

            #return self.attraction.tickets - self.user.tickets
            #check height
        if self.attraction.min_height > self.user.height
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
        end

        self.user.tickets -= self.attraction.tickets
        self.user.nausea += self.attraction.nausea_rating
        self.user.happiness += self.attraction.happiness_rating
        self.user.save

    end

end
