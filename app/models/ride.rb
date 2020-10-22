class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = self.user
    attraction = self.attraction
    message = " "
    if user.tickets < attraction.tickets || user.height < attraction.min_height
      message = 'Sorry.'
      if user.tickets < attraction.tickets
        message += " You do not have enough tickets to ride the #{attraction.name}."
      end

      if user.height < attraction.min_height
        message += " You are not tall enough to ride the #{attraction.name}."
      end
      message
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      message = "Thanks for riding the #{attraction.name}!"
    end
  end

end
