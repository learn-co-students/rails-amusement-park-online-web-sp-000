class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def attraction_name=(name)
        self.attraction = Attraction.find_or_create_by(name: name)
    end

    def attraction_name
        self.attraction ? self.attraction.name : nil
    end

    def take_ride
        # byebug
        if !user_can_cover? && !user_tall_enough?
            "Sorry. You do not have enough tickets to ride the #{self.attraction_name}. You are not tall enough to ride the #{self.attraction_name}."
        elsif !user_can_cover?
            "Sorry. You do not have enough tickets to ride the #{self.attraction_name}."
        elsif !user_tall_enough?
            "Sorry. You are not tall enough to ride the #{self.attraction_name}."
        elsif user_can_cover? && user_tall_enough?
            self.user.update(
                tickets: self.user.tickets -= self.attraction.tickets,
                happiness: self.user.happiness += self.attraction.happiness_rating,
                nausea: self.user.nausea += self.attraction.nausea_rating
            )
            "Thanks for riding the #{self.attraction_name}!"
        end
    end

    def user_tall_enough?
        self.user.height >= self.attraction.min_height
    end

    def user_can_cover?
        self.user.tickets >= self.attraction.tickets
    end

end
