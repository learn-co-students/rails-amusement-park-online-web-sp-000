class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    errors = []

    if self.user.tickets >= self.attraction.tickets && self.user.height >= self.attraction.min_height
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{attraction.name}!"
    else
      errors << "Sorry."
      errors << "You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
      errors << "You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
      errors.join(" ")
    end
  end
end
