class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    tickets_before = self.user.tickets
    attraction_tickets = self.attraction.tickets

    if tickets_before < attraction_tickets and self.user.height < self.attraction.min_height
      return "Sorry. You do not have enough tickets to ride the "\
            "#{self.attraction.name}. You are not tall enough to ride the "\
            "#{self.attraction.name}."
    elsif tickets_before < attraction_tickets
      return "Sorry. You do not have enough tickets to ride the "\
            "#{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      tickets_after = tickets_before - attraction_tickets
      nausea_after = self.user.nausea + self.attraction.nausea_rating
      happiness_after = self.user.happiness + self.attraction.happiness_rating

      self.user.update(tickets: tickets_after, nausea: nausea_after,
      happiness: happiness_after)
      return "Thanks for riding the #{self.attraction.name}!"
    end

  end

end
