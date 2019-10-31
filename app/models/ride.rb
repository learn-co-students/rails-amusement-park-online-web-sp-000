class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user=User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)

    if user.tickets >= attraction.tickets
      if user.height >= attraction.min_height
        user.tickets = user.tickets-attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
        self.save
      else
        "Sorry.  You are not tall enough to ride the #{attraction.name}."
      end
    else
      "Sorry.  You do not have neough tickets to ride the #{attraction.name}."
    end
  end


end
