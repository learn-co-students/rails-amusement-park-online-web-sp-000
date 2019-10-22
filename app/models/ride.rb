class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    attr_accessor :message

    def take_ride
        user = User.find_by(id: self.user_id)
        attraction = Attraction.find_by(id: self.attraction_id)
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            self.message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            self.message = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height 
            self.message = "Sorry. You are not tall enough to ride the #{attraction.name}."
        else 
            self.message = "Thanks for riding the #{attraction.name}!"
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
        end
    end



end