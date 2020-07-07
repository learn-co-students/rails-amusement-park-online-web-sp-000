class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @user_tickets = self.user.tickets
        @user_height = self.user.height
        @user = self.user
        if @user_tickets < self.attraction.tickets && @user_height < self.attraction.min_height
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif @user_tickets < self.attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif @user_height < self.attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            @user.tickets = @user_tickets - self.attraction.tickets
            @user.nausea = @user.nausea + self.attraction.nausea_rating
            @user.happiness = @user.happiness + self.attraction.happiness_rating
            @user.save
            @user
          
        end

    end 

end
 