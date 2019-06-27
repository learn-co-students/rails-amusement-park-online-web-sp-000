class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction



  def take_ride
    if error_message == false
      person = self.user
      attraction = self.attraction
      User.update(person.id, happiness: person.happiness+attraction.happiness_rating, nausea: person.nausea+attraction.nausea_rating, tickets: person.tickets-attraction.tickets)
    else
      error_message
    end
  end

  def error_message
    if ticket_check && height_check
      ticket_check + height_check[6...]
    elsif ticket_check
      ticket_check
    elsif height_check
      height_check
    else
      false
    end
  end

private
  def ticket_check
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
  end

  def height_check
    "Sorry. You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
  end
end
