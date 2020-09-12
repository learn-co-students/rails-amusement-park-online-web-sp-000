
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if not_enough_tickets && too_short
      ticket_message + " " + height_message
    elsif not_enough_tickets
      ticket_message
    elsif too_short
      "Sorry. " + height_message
    else
      get_on_ride
    end
  end

  def ticket_message
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_message
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def not_enough_tickets
    self.user.tickets < self.attraction.tickets
  end

  def too_short
    self.user.height < self.attraction.min_height
  end

  def get_on_ride
    self.user.update(:tickets => (self.user.tickets - self.attraction.tickets),
                       :nausea => (self.user.nausea + self.attraction.nausea_rating),
                       :happiness => (self.user.happiness + self.attraction.happiness_rating)
                      )
    "Thanks for riding the #{self.attraction.name}!"

end


end
