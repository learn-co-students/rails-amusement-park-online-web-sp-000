class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message = []
  	if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.update(tickets: user.tickets - attraction.tickets)
      user.update(nausea: user.nausea + attraction.nausea_rating)
      user.update(happiness: user.happiness + attraction.happiness_rating)

      message << "Thanks for riding the #{attraction.name}!"
    end

    if user.tickets < attraction.tickets
  	  message << "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  	end
    
    if user.height < attraction.min_height
  	 message << "Sorry. You are not tall enough to ride the #{attraction.name}."	  
  	end

 
     
     
      
     
    if message.count > 1
      message.join(" ").gsub(" Sorry.", "")
    else
      message.join
    end
  end  	
end
