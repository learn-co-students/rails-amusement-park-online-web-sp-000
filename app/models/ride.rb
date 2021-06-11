class Ride < ActiveRecord::Base
  belongs_to :attraction
  #"belongs to one attraction"
  belongs_to :user

  def take_ride
    #set conditions so can give error message accordingly
    #makes sense to have a helper method for that so this isn't cluttered

    enough_tickets = meet_requirements[0]
    tall_enough = meet_requirements[1]

    if enough_tickets && tall_enough
      begin_ride #move ride logic to another method
    elsif tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif enough_tickets && !tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

  def begin_ride
    # taking a ride just means to update the user attributes accordingly
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    #"has a method 'take_ride' that updates the user's happiness"
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    #"has a method 'take_ride' that updates the user's nausea"
    new_tickets =  self.user.tickets - self.attraction.tickets
    #"has a method 'take_ride' that updates ticket number"
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
  end

  #does the user meet the requirements to take the ride? can't just
  #return single true or false because error message will differ depending on which requirments are not met

  #"has a method 'take_ride' that accounts for the user not having enough tickets"
  #"has a method 'take_ride' that accounts for the user not being tall enough"
  #"has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets"
  def meet_requirements
    enough_tickets = (self.user.tickets >= self.attraction.tickets)
    tall_enough = (self.user.height >= self.attraction.min_height)
    [enough_tickets, tall_enough]
  end

end