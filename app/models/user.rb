class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    n = self.nausea || 0
    h = self.happiness || 0

    mood = "sad" if n > h        
    mood = "happy" if h > n
    mood
  end
end
