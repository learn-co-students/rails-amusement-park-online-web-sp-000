class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride

    if self.tickets > self.user.tickets && self.attraction.min_height > self.user.height
      "Sorry, you do not have enough tickets for the #{self.attraction.name}"
      "Sorry, you are not tall enough to ride the #{self.attraction.name}"


    elsif self.tickets > self.user.tickets
      "Sorry, you do not have enough tickets for the #{self.attraction.name}"


    elsif self.attraction.min_height > self.user.height
          "Sorry, you are not tall enough to ride the #{self.attraction.name}"

    end
  end

end
