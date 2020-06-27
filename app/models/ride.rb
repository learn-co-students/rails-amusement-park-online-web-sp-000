require 'pry'

class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the Roller Coaster."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the Roller Coaster."
    else
      user.update(
        :tickets => user.tickets - attraction.tickets,
        :nausea => user.nausea + attraction.nausea_rating,
        :happiness => user.happiness + attraction.happiness_rating
        )
    end
  end
end
