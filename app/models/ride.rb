class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user


  def take_ride
    
    if too_short && missing_tickets
      "Sorry. " + missing_tickets_message + " " + too_short_message

    elsif missing_tickets
     "Sorry. " + missing_tickets_message
    
    elsif too_short
        "Sorry. " + too_short_message
    
    else
        go_onto_ride
        "Thanks for riding the #{self.attraction.name}!"
    end
  end


     def missing_tickets
         self.user.tickets < self.attraction.tickets 
     end

     def missing_tickets_message
        "You do not have enough tickets to ride the #{self.attraction.name}."
     end

     def too_short
        self.user.height < self.attraction.min_height
     end

     def too_short_message
        "You are not tall enough to ride the #{self.attraction.name}."
     end

     def go_onto_ride
       
        self.user.update(:tickets => self.user.tickets - self.attraction.tickets,
            :nausea => self.user.nausea + self.attraction.nausea_rating,
            :happiness => self.user.happiness + self.attraction.happiness_rating) 
        end

end
