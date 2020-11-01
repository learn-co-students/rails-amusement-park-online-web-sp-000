class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < self.attraction.tickets && user.height < self.attraction.min_height
       "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif
      user.tickets < self.attraction.tickets && user.height >= self.attraction.min_height
       "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif
      user.tickets >= self.attraction.tickets && user.height < self.attraction.min_height
       "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets = user.tickets - self.attraction.tickets
      user.nausea = user.nausea + self.attraction.nausea_rating
      user.happiness = user.happiness + self.attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
