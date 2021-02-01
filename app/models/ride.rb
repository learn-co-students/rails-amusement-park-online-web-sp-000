class Ride < ActiveRecord::Base
  belongs_to :user 
  belongs_to :attraction

  def take_ride
    out_denied = "Sorry."
    if self.user.tickets < self.attraction.tickets
      out_denied += " You do not have enough tickets to ride the #{attraction.name}."
    end
    if  self.user.height < self.attraction.min_height
      out_denied += " You are not tall enough to ride the #{attraction.name}."
    end
    if out_denied != "Sorry."
      out_denied
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating

      self.user.save
      out_denied = "Thanks for riding the #{self.attraction.name}!"
    end
  end
end
