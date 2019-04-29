class User < ActiveRecord::Base
  has_secure_password

  #already added by has_secure_password
  # validates :password, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
   if self.happiness && self.nausea
     mood = self.happiness - self.nausea
     mood > 0 ? "happy" : "sad"
   end
 end
end
