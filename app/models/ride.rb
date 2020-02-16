class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    raise Exceptions::RideError.new("Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}.") if too_short and not_enough_tickets
    raise Exceptions::NotTallEnoughError.new(self.attraction.name) if too_short
    raise Exceptions::NotEnoughTicketsError.new(self.attraction.name) if not_enough_tickets
    deduct_tickets
    update_happiness
    update_nausea
  end

  private

  def too_short
    self.user.height < self.attraction.min_height
  end

  def not_enough_tickets
    self.user.tickets < self.attraction.tickets
  end

  def deduct_tickets
    update_user(:tickets, -1 * self.attraction.tickets)
  end

  def update_happiness
    update_user(:happiness, self.attraction.happiness_rating)
  end

  def update_nausea
    update_user(:nausea, self.attraction.nausea_rating)
  end

  def update_user(attribute, value)
    self.user.update(attribute => (self.user.send(attribute) + value))
  end

end