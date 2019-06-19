class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    cant_ride = []
    cant_ride << "You do not have enough tickets to ride the #{self.attraction.name}." if self.attraction.tickets > self.user.tickets
    cant_ride << "You are not tall enough to ride the #{self.attraction.name}." if self.attraction.min_height > self.user.height

    return "Sorry. #{cant_ride.join(" ")}" unless cant_ride.empty?

    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
    return "Thanks for riding the #{self.attraction.name}!"
  end
end
