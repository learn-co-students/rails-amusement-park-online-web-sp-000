class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  after_initialize :init

  def init
    self.admin ||= false
    self.happiness ||= 0
    self.nausea ||= 0
    self.tickets ||= 0
    self.height ||= 0
  end

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end
end
