class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    failures = "Sorry."
    if attraction.tickets > user.tickets
      failures += " You do not have enough tickets to ride the #{attraction.name}."
    end
    if attraction.min_height > user.height
      failures += " You are not tall enough to ride the #{attraction.name}."
    end
    if failures != "Sorry."
      return failures
    end

    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
