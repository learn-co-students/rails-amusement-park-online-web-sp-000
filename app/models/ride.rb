class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
      if self.user.height>self.attraction.min_height && self.user.tickets>self.attraction.tickets
        new_nausea=self.user.nausea+self.attraction.nausea_rating
        new_happy=self.user.happiness+self.attraction.happiness_rating
        new_tickets=self.user.tickets-self.attraction.tickets
        rider=User.find_by(name: self.user.name)
        rider.update_attribute(:nausea, new_nausea)
        rider.update_attribute(:happiness, new_happy)
        rider.update_attribute(:tickets, new_tickets)
      elsif self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
         "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
          "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
          elsif self.user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
          end
        end
      end  

      

         
      
    
  
  
          
    
    

      
  
      
