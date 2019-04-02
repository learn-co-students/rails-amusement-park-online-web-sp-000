class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, :through => :rides

  def take_ride
    if user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
