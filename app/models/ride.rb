class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message_one = "You do not have enough tickets to ride the #{self.attraction.name}."
    message_two = "You are not tall enough to ride the #{self.attraction.name}."
    #new_amount = self.user.tickets - self.attraction.tickets
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. " + message_one + " " + message_two
    elsif self.user.height < self.attraction.min_height
      "Sorry. " + message_two
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. " + message_one
    else
      #new_ticket_amount = self.user.tickets - self.attraction.tickets
      #new_nausea = self.user.nausea + self.attraction.nausea_rating
      #new_happiness = self.user.happiness + self.attraction.happiness_rating
      #code below is not working. need to work on it further
      self.user.update(
        :tickets => self.user.tickets -= self.attraction.tickets,
        :nausea => self.user.nausea += self.attraction.nausea_rating,
        :happiness => self.user.happiness += self.attraction.happiness_rating
        )
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end
