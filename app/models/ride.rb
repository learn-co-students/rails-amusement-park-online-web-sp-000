class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # byebug
    attraction = self.attraction 
    user = self.user 
    notice = ["Sorry."]
    notice.push("You do not have enough tickets to ride the #{attraction.name}.") if user.tickets < attraction.tickets
    notice.push("You are not tall enough to ride the #{attraction.name}.") if user.height < attraction.min_height
    
    return notice.join(' ') if notice.size > 1
    
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end
end
