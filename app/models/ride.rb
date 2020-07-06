class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        binding.pry
        #ticket requirement
        #height requirement
        #height and ticket requirements
        #updates users tickets after ride
        #updates users nausea after ride
        #updates users happiness after ride

    end 

end
