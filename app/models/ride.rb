class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def has_enough_tickets?
    user.tickets > attraction.tickets
  end

  def is_tall_enough?
    user.height > attraction.min_height
  end

  def take_tickets
    user.update(:tickets => (user.tickets - attraction.tickets))
  end

  def update_mood
    user.update(:happiness => (user.happiness + attraction.happiness_rating))
    user.update(:nausea => (user.nausea + attraction.nausea_rating))
  end

  def take_ride
    if has_enough_tickets? && is_tall_enough?
      take_tickets
      update_mood
    elsif !has_enough_tickets? && !is_tall_enough?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !has_enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !is_tall_enough?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

end
