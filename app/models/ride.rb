class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    tickets_required = self.attraction.tickets
    rider_tickets = self.user.tickets
    height_required = self.attraction.min_height
    rider_height = self.user.height
    if tickets_required > rider_tickets && rider_height > height_required
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif tickets_required < rider_tickets && rider_height < height_required
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif tickets_required > rider_tickets && rider_height < height_required
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.tickets = rider_tickets - tickets_required
      self.user.happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.save
    end
  end

end
