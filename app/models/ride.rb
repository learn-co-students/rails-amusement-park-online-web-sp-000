class Ride < ActiveRecord::Base
  #rails g resource Ride user_id:integer attraction_id:integer --no-test-framework --skip
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    if (user.tickets -= attraction.tickets).negative?
      if !user.tall_enough?(attraction)
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      else
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      end
    elsif !user.tall_enough?(attraction)
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      attraction.rides << self
      attraction.save
      user.rides << self
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
