class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction



  def take_ride
    if error_message == false
      self.user.happiness += self.attraction.happiness_rating
      self.user.nausea += self.attraction.nausea_rating
      self.user.tickets -= self.attraction.tickets
    else
      error_message
    end
  end

private
  def ticket_check
    "Sorry. You do not have enough tickets to ride the Roller Coaster." if self.user.tickets < self.attraction.tickets
  end

  def height_check
    "Sorry. You are not tall enough to ride the Roller Coaster." if self.user.height < self.attraction.min_height
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
end
