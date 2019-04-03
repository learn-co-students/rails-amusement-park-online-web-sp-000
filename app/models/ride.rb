class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets && !tall_enough
      "Sorry. #{not_enough_ticket_message} #{not_tall_enough_message}"
    elsif !enough_tickets
      "Sorry. #{not_enough_ticket_message}"
    elsif !tall_enough
      "Sorry. #{not_tall_enough_message}"
    else
      user.update(tickets: updates_ticket_number, nausea: updates_nausea, happiness: updates_happiness)
    end
  end

  def enough_tickets
    user.tickets >= attraction.tickets
  end

  def tall_enough
    user.height >= attraction.min_height
  end

  def updates_ticket_number
    user.tickets - attraction.tickets
  end

  def updates_nausea
    user.nausea + attraction.nausea_rating
  end

  def updates_happiness
    user.happiness + attraction.happiness_rating
  end

  def not_enough_ticket_message
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def not_tall_enough_message
    "You are not tall enough to ride the #{attraction.name}."
  end
end