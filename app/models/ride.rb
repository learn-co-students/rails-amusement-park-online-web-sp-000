class Ride < ActiveRecord::Base
  belongs_to :user 
  belongs_to :attraction
  
  def take_ride
    # byebug
    if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.attraction.min_height > self.user.height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif
      self.user.update(tickets: self.user.tickets - self.attraction.tickets, nausea: self.user.nausea + self.attraction.nausea_rating, happiness: self.user.happiness + self.attraction.happiness_rating)
      "Thanks for riding the #{self.attraction.name}!"
    # else 
        # redirect_to attraction_path(attraction)
    end
  end
end



# check if user has passed all the checks and then return the message
# after user passes all the checks return the message 
# Thanks for riding the
# try refactoring take_ride method
# what is the return value of take_ride? how to render in controller
# if line 13 returns true do something if false do something else