class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user_has_enough_tickets && user_is_tall_enough
      start_ride
    elsif !user_has_enough_tickets && user_is_tall_enough
      "Sorry. " + not_enough_tickets
    elsif user_has_enough_tickets && !user_is_tall_enough
      "Sorry. " + not_tall_enough
    elsif !user_has_enough_tickets && !user_is_tall_enough
      "Sorry. " + not_enough_tickets + " " + not_tall_enough
    end
  end

  private

  def start_ride
    new_ticket_count = self.user.tickets - self.attraction.tickets
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_happiness = self.user.happiness + self.attraction.happiness_rating

    self.user.update(
      tickets: new_ticket_count,
      nausea: new_nausea,
      happiness: new_happiness
    )
  end

  def user_has_enough_tickets
    return true if self.user.tickets >= self.attraction.tickets
  end

  def user_is_tall_enough
    return true if self.user.height >= self.attraction.min_height
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}."
  end

end
