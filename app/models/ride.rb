class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction


  def take_ride
    enough_tickets, tall_enough = requirements_met
    if enough_tickets && tall_enough
      start_ride
    elsif tall_enough && !enough_tickets
      "Sorry. #{not_enough_tickets}"
    elsif enough_tickets && !tall_enough
      "Sorry. #{not_tall_enough}"
    elsif !enough_tickets && !tall_enough
      "Sorry. #{not_enough_tickets} #{not_tall_enough}"
    end
  end

  def requirements_met
    enough_tickets, tall_enough = false
    if self.user.tickets >= self.attraction.tickets
      enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
      tall_enough = true
    end
    return [enough_tickets, tall_enough]
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_ticket_count = self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_ticket_count
    )
    "Thanks for riding the #{self.attraction.name}"
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_tall_enough
    "You are not tall enough to ride the #{self.attraction.name}."
  end
end
