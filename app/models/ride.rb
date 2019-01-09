class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    problem = ""
    problem += " You do not have enough tickets to ride the #{attraction.name}." unless user_has_enough_tickets?
    problem += " You are not tall enough to ride the #{attraction.name}." unless user_is_tall_enough?
    
    if problem.present?
      "Sorry." + problem
    else
      update_user_for_ride
    end
  end

  private

  def user_has_enough_tickets?
    user.tickets >= attraction.tickets
  end

  def user_is_tall_enough?
    user.height >= attraction.min_height
  end

  def update_user_for_ride
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

end
