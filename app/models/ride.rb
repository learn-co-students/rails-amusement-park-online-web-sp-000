class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    #accounts for the user not having enough tickets
    #accounts for the user not been tall enough
    #both
    #update tickets number
    #update the user nausea
    #update the user happiness
  end

end
