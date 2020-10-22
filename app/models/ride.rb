class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    include ActiveModel::Validations
    
    
   


    def take_ride
        user = self.user
        attraction = self.attraction
        validates_with AffordableValidator
        validates_with TallEnoughValidator
        if self.errors[:user_id].empty?  
            self.buy(user, attraction)
            "Thanks for riding the #{attraction.name}!"
        else
           "Sorry. " + self.errors[:user_id].join(" ")
        end

      
    end



    def buy(user, attraction)
        user.tickets = user.tickets - attraction.tickets
        user.happiness = user.happiness + attraction.happiness_rating 
        user.nausea = user.nausea + attraction.nausea_rating 
        user.save
    end

    

end
