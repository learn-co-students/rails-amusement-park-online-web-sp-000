class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets 
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the Roller Coaster."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      update_tickets
      update_nausea
      update_happiness
    end
  end

  def update_tickets
    self.user.update_attributes(tickets: self.user.tickets - self.attraction.tickets)
  end

  def update_nausea
    self.user.update_attributes(nausea: self.user.nausea + self.attraction.nausea_rating)
  end

  def update_happiness
    self.user.update_attributes(happiness: self.user.happiness + self.attraction.happiness_rating)
  end
end
