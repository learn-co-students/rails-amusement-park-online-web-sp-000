class Ride < ActiveRecord::Base
   belongs_to :attraction
   belongs_to :user

   def take_ride 
      if user_tickets_and_height_not_enough?
         "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
      elsif tickets_not_enough?
         "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      elsif  user_height_not_tall_enough?
         "Sorry. You are not tall enough to ride the #{attraction.name}." 
      elsif user_tickets_are_enough
         update_user_tickets_nausea_happiness
      end 
   end 

   def tickets_not_enough?  
      self.user.tickets < self.attraction.tickets
   end 

   def user_tickets_and_height_not_enough?
      self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
   end 

   def user_height_not_tall_enough?
      self.user.height < self.attraction.min_height
   end 

   def user_tickets_are_enough
      self.user.tickets >= self.attraction.tickets
   end 

   def update_user_tickets_nausea_happiness
      self.user.update(:tickets => self.user.tickets - self.attraction.tickets,
         :nausea => self.user.nausea + self.attraction.nausea_rating,
         :happiness => self.user.happiness + self.attraction.happiness_rating)
   end 

end
