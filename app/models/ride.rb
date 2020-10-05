class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if eligible_user?
        self.user.update(
            tickets: update_user_tickets, 
            nausea: update_user_nausea, 
            happiness: update_user_happiness
        )
    end
    user_message
  end

  def eligible_user?
    !!self.enough_tickets? && self.tall_enough?
  end

  def user_message
    if eligible_user?
        user_message = "Thanks for riding the #{self.attraction.name}!"
    else
        user_message = "Sorry."
        user_message << " You do not have enough tickets to ride the #{self.attraction.name}." if !self.enough_tickets?
        user_message << " You are not tall enough to ride the #{self.attraction.name}." if !self.tall_enough?
    end
    user_message
  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def update_user_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def update_user_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def update_user_happiness
    self.user.happiness += self.attraction.happiness_rating
  end
end
