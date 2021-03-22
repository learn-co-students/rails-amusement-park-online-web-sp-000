class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = self.user
    attraction = self.attraction
    output_msg = "Sorry. "

    if user.tickets < attraction.tickets
      output_msg << "You do not have enough tickets to ride the #{attraction.name}."
      if user.height < attraction.min_height
        output_msg << " You are not tall enough to ride the #{attraction.name}."
      end
      output_msg
    elsif user.height < attraction.min_height
      output_msg << "You are not tall enough to ride the #{attraction.name}."
      output_msg
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
