class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  # accounts for the user not having enough tickets
  # accounts for the user not being tall enough
  # accounts for the user not being tall enough and not having enough tickets
  # updates ticket number
  # updates the user's nausea
  # updates the user's happiness
  def take_ride
    if user.tickets < attraction.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets >= attraction.tickets && user.height >= attraction.min_height
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    end
  end
end
