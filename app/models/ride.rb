class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user_is_tall_enough? && user_has_enough_tickets?
      user_ride
    elsif !user_is_tall_enough? && !user_has_enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !user_is_tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !user_has_enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

  end

  def user_is_tall_enough?
    self.user.height >= self.attraction.min_height ? true : false
  end

  def user_has_enough_tickets?
    self.user.tickets >= self.attraction.tickets ? true : false
  end


  def update_tickets
    tickets_left = self.user.tickets - self.attraction.tickets
    self.user.tickets = tickets_left
    self.user.save
  end

  def update_nausea
    nausea_points = self.user.nausea + self.attraction.nausea_rating
    self.user.nausea = nausea_points
    self.user.save
  end

  def update_happiness
    happiness_points = self.user.happiness + self.attraction.happiness_rating
    self.user.happiness = happiness_points
    self.user.save
  end

  def user_ride
    self.update_happiness
    self.update_nausea
    self.update_tickets
    "Thanks for riding the #{self.attraction.name}!"
  end

end
