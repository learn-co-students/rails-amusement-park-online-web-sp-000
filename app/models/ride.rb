class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  #methods
  def take_ride

    if !enough_tickets? && !tall_enough?
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets?
      return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough?
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      new_tickets = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.update(:tickets => new_tickets, :happiness => new_happiness, :nausea => new_nausea)
    end

  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end
end
