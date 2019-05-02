class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if short && broke
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif short
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif broke
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      new_tickets = (self.user.tickets - self.attraction.tickets)
      new_nausea = (self.user.nausea + self.attraction.nausea_rating)
      new_happiness = (self.user.happiness + self.attraction.happiness_rating)
      self.user.update(:tickets => new_tickets, :nausea => new_nausea, :happiness => new_happiness)
      return "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def short
    self.user.height < self.attraction.min_height
  end

  def broke
    self.user.tickets < self.attraction.tickets
  end

end
