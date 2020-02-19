class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if not_enough_tickets? && not_tall_enough?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      new_ticket = (self.user.tickets) - (self.attraction.tickets)
      new_nausea = (self.user.nausea) + (self.attraction.nausea_rating)
      new_happiness = (self.user.happiness) + (self.attraction.happiness_rating)
      self.user.update(:tickets => new_ticket , :happiness => new_happiness, :nausea => new_nausea)
    end
    #accounts for the user not having enough tickets
    #accounts for the user not been tall enough
    #both
    #update tickets number
    #update the user nausea
    #update the user happiness
  end

  def not_enough_tickets?
    self.user.tickets < self.attraction.tickets
  end

  def not_tall_enough?
    self.attraction.min_height > self.user.height
  end
end
