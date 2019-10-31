class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user=User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)
    pauper = "You do not have enough tickets to ride the #{attraction.name}."
    shorty = "You are not tall enough to ride the #{attraction.name}."
    
    
    if (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
     return "Sorry. "+pauper+" " +shorty
    end

    if user.tickets >= attraction.tickets
      if user.height >= attraction.min_height
        
        user.tickets = user.tickets-attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        self.save

      else
        "Sorry. "+shorty
      end
    else
      "Sorry. "+pauper
    end
  end


end
