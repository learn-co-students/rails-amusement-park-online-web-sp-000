class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if tall_enough? && enough_tickets?
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      self.save
      "Thanks for riding the #{attraction.name}!"
    else
      errorMsg = "Sorry. "
      if !enough_tickets?
        errorMsg += "You do not have enough tickets to ride the #{attraction.name}. "
      end
      if !tall_enough?
        errorMsg += "You are not tall enough to ride the #{attraction.name}."
      end
      return errorMsg.strip
    end
  end

  def tall_enough?
    attraction.min_height < user.height
  end

  def enough_tickets?
    attraction.tickets < user.tickets
  end

end
