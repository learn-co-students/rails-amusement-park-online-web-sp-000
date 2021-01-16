class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    # validates :user_id, presence: true
    # validates :attraction_id, presence: true

    def take_ride
        if tall_enough == true && enough_tickets == true
            update_user
        elsif tall_enough == true
            "Sorry. " + enough_tickets
        elsif enough_tickets == true
            "Sorry. " + tall_enough  
        else
            "Sorry. " + enough_tickets + " " + tall_enough
        end
    end

    def tall_enough
        self.user.height >= self.attraction.min_height ? true : "You are not tall enough to ride the #{self.attraction.name}."
    end

    def enough_tickets
        self.user.tickets >= self.attraction.tickets ? true : "You do not have enough tickets to ride the #{self.attraction.name}." 
    end

    def update_user
        self.user.tickets -= self.attraction.tickets
        self.user.happiness += self.attraction.happiness_rating
        self.user.nausea += self.attraction.nausea_rating
        self.user.save
        "Thanks for riding the #{self.attraction.name}!"
    end

end
