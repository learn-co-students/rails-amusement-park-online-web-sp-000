class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        # accounts for user not having enough tickets
        # '' not being tall enough
        # '' not tall enough and not having enough tickets
        # updates ticket number
        # updates user's happiness, nausea
    end

end
