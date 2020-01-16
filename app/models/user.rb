# class User < ApplicationRecord
#   has_many :rides
#   has_many :attractions, through: :rides
#   has_secure_password
#
#   def admin
#     self[:admin].nil? ? false : self[:admin]
#   end
#
#   def affect_mood(happiness_rating)
#     self.happiness = self.happiness + happiness_rating
#     self.save
#   end
#
#   def add_to_nausea(nausea_rating)
#     self.nausea = self.nausea + nausea_rating
#     self.save
#   end
#
#   def mood
#     self.nausea > self.happiness ? "sad" : "happy"
#   end
#
#   def raise_mood
#     self.happiness = self.happiness.to_i + 1
#     self.save
#   end
#
#   def remove_tickets(num_tickets)
#     self.tickets = self.tickets.to_i - num_tickets.to_i
#     self.save
#   end
# end

class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness.present? && self.nausea.present?
      if self.happiness < self.nausea
        "sad"
      else
        "happy"
      end
    end
  end

  def user_name
    self.name
  end

  def last_ride
    if self.rides.present?
      self.rides.last
    end
  end

end
