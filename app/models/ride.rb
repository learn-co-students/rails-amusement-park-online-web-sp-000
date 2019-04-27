class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if short && broke
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif broke
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif short
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      process_ride
    end
  end

  def short
    self.user.height < self.attraction.min_height
  end

  def broke
    self.user.tickets < self.attraction.tickets
  end

  def process_ride
    tickets = self.user.tickets - self.attraction.tickets
    happiness = self.user.happiness + self.attraction.happiness_rating
    nausea = self.user.nausea + self.attraction.nausea_rating
    self.user.update(:tickets => tickets, :happiness => happiness, :nausea => nausea)
  end


end
