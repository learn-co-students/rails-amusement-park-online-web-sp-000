class User < ActiveRecord::Base
   has_many :rides
   has_many :attractions, through: :rides 
   has_secure_password 

   def mood 
      # returns 'sad' when the user is more nauseous than happy
      if self.nausea > self.happiness 
         "sad"
      else  
         "happy"
      end 
   end 

end
