class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def init
    self.admin ||= false
  end

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end
end
