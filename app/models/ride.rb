class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

  def enough_height? 
    user.height >= attraction.min_height
  end
  
  def spend_tickets
    user.update(tickets: user.tickets - attraction.tickets)
  end
  
  def change_mood
    user.update(happiness: user.happiness + attraction.happiness_rating)
    user.update(nausea: user.nausea + attraction.nausea_rating)
  end
  
  def take_ride
    message = ""
    if enough_height? && enough_tickets?
      spend_tickets
      change_mood
      message = "Thanks for riding the #{attraction.name}!"
    else
      message += "Sorry."
      if !enough_tickets? 
       message += " You do not have enough tickets to ride the #{attraction.name}."
      end
      if !enough_height?
       message += " You are not tall enough to ride the #{attraction.name}."
      end
    end
    message
  end
end
