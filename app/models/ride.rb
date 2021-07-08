class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    user = User.find(user_id)
    attraction = Attraction.find(attraction_id)

    errors = []
    errors << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
    errors << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height

    return errors.unshift('Sorry.').join(' ') unless errors.empty?

    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save

  end

end
