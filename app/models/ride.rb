require "pry"

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    error_msg = ""
    if self.user.tickets < self.attraction.tickets
      error_msg = " You do not have enough tickets to ride the #{self.attraction.name}."
    end
    if self.user.height < self.attraction.min_height
      error_msg += " You are not tall enough to ride the #{self.attraction.name}."
    end
    if !error_msg.empty?
      error_msg = "Sorry." + error_msg
      return error_msg
    end
    self.user.update(tickets: self.user.tickets - self.attraction.tickets)
    self.user.update(nausea: self.user.nausea + self.attraction.nausea_rating)
    self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating)
  end

end
