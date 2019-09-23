class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    # test for tickets
    if !user_is_tall_enough? && !user_has_enough_tickets?
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end

    if !user_has_enough_tickets?
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

    if !user_is_tall_enough?
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end


    user.tickets = user.tickets - attraction.tickets
    user.nausea = user.nausea + attraction.nausea_rating
    user.happiness = user.happiness + attraction.happiness_rating
    user.save

    "Thanks for riding the #{attraction.name}!"
  end

  private

  def user_has_enough_tickets?
    attraction.tickets <= user.tickets
  end

  def user_is_tall_enough?
    attraction.min_height <= user.height
  end

end
