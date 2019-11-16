class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by_id(self.user_id)
    attraction = Attraction.find_by_id(self.attraction_id)
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      tickets_left = user.tickets - attraction.tickets
      nausea_level = user.nausea + attraction.nausea_rating
      happiness_level = user.happiness + attraction.happiness_rating
      # must use update_attribute
      user.update_attribute(:tickets, tickets_left)
      user.update_attribute(:nausea, nausea_level)
      user.update_attribute(:happiness, happiness_level)
      return "Thanks for riding the #{attraction.name}!"
    end
  end



end


  # has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 45)
  # has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 46)
  # has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 47)
  # has a method 'take_ride' that updates ticket number (FAILED - 48)
  # has a method 'take_ride' that updates the user's nausea (FAILED - 49)
  # has a method 'take_ride' that updates the user's happiness (FAILED - 50)
