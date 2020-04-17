class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  
  def initialize(args)
    @ride_restrictions = ["Sorry."]
    super
  end

  def take_ride
    has_tickets = enough_tickets?
    not_too_short = tall_enough?
    if has_tickets && not_too_short
      update_user_levels
    else
      @ride_restrictions.join(' ')
    end
  end

  private
  
  def update_user_levels
    adjust_tickets
    adjust_happiness
    adjust_nausea
    self.user.save
  end

  def adjust_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def adjust_happiness
    self.user.happiness += self.attraction.happiness_rating
  end

  def adjust_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def enough_tickets?
    if self.user.tickets < self.attraction.tickets
      @ride_restrictions << "You do not have enough tickets to ride the #{self.attraction.name}."
      false
    else
      true
    end
  end

  def tall_enough?
    if self.user.height < self.attraction.min_height
      @ride_restrictions << "You are not tall enough to ride the #{self.attraction.name}."
      false
    else
      true
    end
  end
end
