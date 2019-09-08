class Ride < ActiveRecord::Base
  validates :user_id, presence: true
  validates :attraction_id, presence: true
  belongs_to :attraction
  belongs_to :user

  def take_ride
    user_tickets = user.tickets
    attr_tickets = attraction.tickets
    user_height = user.height
    attr_height = attraction.min_height
    attr_name = attraction.name

    if ticket_compare(user_tickets, attr_tickets) && height_compare(user_height, attr_height)
      "Sorry. You do not have enough tickets to ride the #{attr_name}. You are not tall enough to ride the #{attr_name}."
    elsif ticket_compare(user_tickets, attr_tickets)
      "Sorry. You do not have enough tickets to ride the #{attr_name}."
    elsif height_compare(user_height, attr_height)
      "Sorry. You are not tall enough to ride the #{attr_name}."
    else
      user_tickets -= attr_tickets
      user.tickets = user_tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding the #{attr_name}!"
    end
  end

  def ticket_compare(user_tickets, attr_tickets)
    attr_tickets > user_tickets
  end

  def height_compare(user_height, attr_height)
    attr_height > user_height
  end

end
