class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
     
        def take_ride
            
            if !not_enough && !too_short 
                user_goes_on_ride                
            elsif !not_enough && too_short 
                "Sorry. You are not tall enough to ride the #{attraction.name}."
            elsif not_enough && !too_short 
                "Sorry. You do not have enough tickets to ride the #{attraction.name}."
                else
                "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
             end 
                 
        end 

        def user_goes_on_ride
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
            "Thanks for riding the #{self.attraction.name}!"
        end 


        def not_enough
            user.tickets < attraction.tickets 
         end 
    
        def too_short 
            user.height < attraction.min_height 
        end 

       


end
