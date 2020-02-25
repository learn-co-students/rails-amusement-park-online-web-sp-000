class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = User.find(self.user_id)
    (user.tickets < self.attraction.tickets && user.height < self.attraction.min_height) ? (return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the Roller Coaster.") : nil
    user.height < self.attraction.min_height ? (return "Sorry. You are not tall enough to ride the #{self.attraction.name}.") : nil
    user.tickets > self.attraction.tickets ? (user.tickets = user.tickets - self.attraction.tickets) : (return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}.")

    user.happiness = user.happiness + self.attraction.happiness_rating
    user.nausea = user.nausea + self.attraction.nausea_rating
    user.save
    "Thanks for riding the #{self.attraction.name}!"
  end
end
