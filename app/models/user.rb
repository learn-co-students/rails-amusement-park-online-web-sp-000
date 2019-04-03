class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  before_save :default_admin

  def default_admin
    self.admin ||= false
  end

  def mood
    if self.happiness && self.nausea
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end
end