class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.happiness && self.nausea
      self.nausea > self.happiness ? "sad" : "happy"
    end
  end

  def admin?
    self.admin
  end
end
