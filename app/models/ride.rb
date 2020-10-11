class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        # binding.pry
        error=[]
        error_str=""
        if self.attraction.tickets > self.user.tickets
            error << "do not have enough tickets"
        end
        if self.attraction.min_height > self.user.height
            error << "are not tall enough"
        end
        if !error.empty?
            error_str = "Sorry."
            error.each do |e|
                error_str += " You #{e} to ride the #{attraction.name}."
            end
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            error_str = "Thanks for riding the #{attraction.name}!"
        end
        error_str
    end
end
