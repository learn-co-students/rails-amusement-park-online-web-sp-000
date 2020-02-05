class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    ride = []
    ride[0] = " "
    if user.tickets < attraction.tickets
      tick = "You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      ht = "You are not tall enough to ride the #{attraction.name}."
    end

    if user.tickets > attraction.tickets && user.height > attraction.min_height
      user.update(:tickets => (user.tickets - attraction.tickets))
      user.update(:nausea => (user.nausea + attraction.nausea_rating))
      user.update(:happiness => (user.happiness + attraction.happiness_rating))
    end

    ride << tick
    ride << ht

    unless ride.first.empty?
      ride[0] = "Sorry."
    end
    result = ride.compact.split("").flatten.join(" ")
    result
  end

end