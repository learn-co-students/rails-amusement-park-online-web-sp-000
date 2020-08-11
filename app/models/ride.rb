class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  # accounts for the user not having enough tickets
  # accounts for the user not being tall enough
  # accounts for the user not being tall enough and not having enough tickets
  # updates ticket number
  # updates the user's nausea
  # updates the user's happiness

  @message = []

  def ride

  end

  def low_tickets
    self.user.tickets < self.attraction.tickets
    @message << "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  def too_short
    self.user.min_height < self.attraction.min_height
    @message << "Sorry. You are not tall enough to ride the #{attraction.name}."
  end

  def short_and_poor
    if low_tickets && too_short
      @message << "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def take_ride
      user.tickets >= attraction.tickets && user.height >= attraction.min_height
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    end
  end
end
