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
