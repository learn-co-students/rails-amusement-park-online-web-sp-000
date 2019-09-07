class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    # binding.pry
    self.nausea > self.happiness ? "sad" : "happy" if self.nausea && self.happiness
  end
end
