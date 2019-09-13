<<<<<<< HEAD
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    errors = "Sorry."
    errors << " You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    errors << " You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    if errors != "Sorry."
      errors
    else
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      return nil
    end
  end
    
end
=======
class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
end
>>>>>>> e8b0703528b15e83c1bb7b10c90cc4b17f96d7ed
