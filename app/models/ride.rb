class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."

      elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."

      elsif self.attraction.min_height > self.user.height
          "Sorry. You are not tall enough to ride the #{self.attraction.name}."

      else
        go_on_ride
        "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def go_on_ride
    self.user.update(:tickets => (self.user.tickets - self.attraction.tickets),
                     :nausea => (self.user.nausea + self.attraction.nausea_rating),
                     :happiness => (self.user.happiness + self.attraction.happiness_rating)
                    )
  end
end
