class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    rider = User.find_by_id(self.user_id)
    ride = Attraction.find_by_id(self.attraction_id)

    if rider.height < ride.min_height && rider.tickets < ride.tickets
      return "Sorry. You do not have enough tickets to ride the #{ride.name}. You are not tall enough to ride the #{ride.name}."
    elsif rider.height < ride.min_height
      return "Sorry. You are not tall enough to ride the #{ride.name}."
    elsif rider.tickets < ride.tickets
      return "Sorry. You do not have enough tickets to ride the #{ride.name}."
    else
      tickets_left = rider.tickets - ride.tickets
      new_nausea = rider.nausea + ride.nausea_rating
      new_happiness = rider.happiness + ride.happiness_rating
      rider.update(tickets: tickets_left, happiness: new_happiness, nausea: new_nausea)
      return "Thanks for riding the #{ride.name}!"
    end

  end

end
