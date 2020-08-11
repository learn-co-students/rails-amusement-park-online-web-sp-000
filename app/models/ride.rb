class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  # accounts for the user not having enough tickets
  # accounts for the user not being tall enough
  # accounts for the user not being tall enough and not having enough tickets
  # updates ticket number
  # updates the user's nausea
  # updates the user's happiness

  def take_ride
    if low_tickets && too_short
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. " + "You are not tall enough to ride the #{self.attraction.name}."
    elsif low_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif too_short
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      ride
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def low_tickets
    self.user.tickets < self.attraction.tickets
  end

  def too_short
    self.user.height < self.attraction.min_height
  end

  def ride
      user.tickets >= attraction.tickets && user.height >= attraction.min_height
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    end
  end
