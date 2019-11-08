class User < ApplicationRecord

  has_many :rides
  has_many :attractions, through: :rides

   has_secure_password

   def mood
     unless self.admin
     self.nausea > self.happiness ? "sad" : "happy"
    end
   end

end
