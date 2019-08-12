class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      new_user_tickets = user.tickets - attraction.tickets
      new_user_nausea = user.nausea + attraction.nausea_rating
      new_user_happiness = user.happiness + attraction.happiness_rating
      user.update(tickets: new_user_tickets, nausea: new_user_nausea, happiness: new_user_happiness)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
