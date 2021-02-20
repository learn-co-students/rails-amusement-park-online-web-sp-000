class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user.tickets < attraction.tickets && user.height < attraction.min_height
           @error = "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
            # errors.add(:user_id, "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster.")
            # flash[:message] = "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif user.tickets < attraction.tickets
            @error = "Sorry. You do not have enough tickets to ride the Roller Coaster."
            # errors.add(:user_id, "Sorry. You do not have enough tickets to ride the Roller Coaster.")
            # flash[:message] = "Sorry. You do not have enough tickets to ride the Roller Coaster."
        elsif user.height < attraction.min_height
            @error = "Sorry. You are not tall enough to ride the Roller Coaster."
            # errors.add(:user_id, "Sorry. You are not tall enough to ride the Roller Coaster.")
            # flash[:message] = "Sorry. You are not tall enough to ride the Roller Coaster."
        else
        x=user.tickets - attraction.tickets
        y=user.happiness + attraction.happiness_rating
        z=user.nausea + attraction.nausea_rating
        user.update(:tickets => x, :happiness => y, :nausea => z)
        end 
    end

    def display_message
        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
            "Thanks for riding the #{attraction.name}!"
        elsif user.height < attraction.min_height && user.tickets < attraction.tickets
            "You are not tall enough to ride the #{attraction.name}. You do not have enough tickets to ride the #{attraction.name}"
        elsif user.height < attraction.min_height
            "You are not tall enough to ride the #{attraction.name}"
        elsif user.tickets < attraction.tickets
            "You do not have enough tickets to ride the #{attraction.name}"
        end
    end
end
