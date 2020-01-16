class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def attraction_name
    self.attraction.name
  end

  def flash_message
    errors = ["Sorry."]
    errors << "You do not have enough tickets to ride the #{self.attraction_name}." unless self.user_has_enough_tickets?
    errors << "You are not tall enough to ride the #{self.attraction_name}." unless self.user_is_tall_enough?
    errors.join(" ")
  end

  def can_ride?
    self.user_has_enough_tickets? && self.user_is_tall_enough?
  end

  def take_ride
    if self.can_ride?
      self.user.remove_tickets(self.attraction.tickets)
      self.user.affect_mood(self.attraction.happiness_rating)
      self.user.add_to_nausea(self.attraction.nausea_rating)
    else
      self.flash_message
    end
  end

  def user_has_enough_tickets?
    !self.user.tickets.nil? && self.user.tickets >= self.attraction.tickets
  end

  def user_is_tall_enough?
    !self.user.height.nil? && self.user.height >= self.attraction.min_height
  end
end
