class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    store = []
    message = ""
    if self.user.tickets < self.attraction.tickets
      store << "You do not have enough tickets to ride the #{self.attraction.name}"
    else
      self.user.update_attribute :tickets, self.user.tickets - self.attraction.tickets
      self.user.update_attribute :nausea, self.user.nausea + self.attraction.nausea_rating
      self.user.update_attribute :happiness, self.user.happiness + self.attraction.happiness_rating
    end
    if self.user.height < self.attraction.min_height
      store << "You are not tall enough to ride the #{self.attraction.name}"
    end
    
    if store.length > 0 
      store.each_with_index do |m, i|
        message = message + m
        if i < store.length - 1
          message = message + " "
        end
      end
    end
    message
  end
end
