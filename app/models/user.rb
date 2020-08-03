class User < ActiveRecord::Base
   has_many :rides
   has_many :attractions, through: :rides 
   has_secure_password 

   def mood 
      if self.nausea && self.happiness
         if user_more_nauseous_than_happy 
            "sad"
         else  
            "happy"
         end 
      end 
   end 

   def user_more_nauseous_than_happy
      self.nausea > self.happiness 
   end 

end
