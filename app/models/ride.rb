class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if User.tickets < Attraction.tickets
            return "Sorry. You do not have enough tickets to ride the roller Coaster."
        end
        
    end

#   2) Ride has a method 'take_ride' that accounts for the user not being tall enough
#      Failure/Error: expect(ride.take_ride).to eq("Sorry. You are not tall enough to ride the #{attraction.name}.")
     
#        expected: "Sorry. You are not tall enough to ride the Roller Coaster."
#             got: nil

#   3) Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
#      Failure/Error: expect(ride.take_ride).to eq("Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}.")
     
#        expected: "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
#             got: nil
     

#   4) Ride has a method 'take_ride' that updates ticket number
#      Failure/Error: expect(mindy.tickets).to eq(5)
     
#        expected: 5
#             got: 10

#   5) Ride has a method 'take_ride' that updates the user's nausea
#      Failure/Error: expect(mindy.nausea).to eq(7)
     
#        expected: 7
#             got: 5

#   6) Ride has a method 'take_ride' that updates the user's happiness
#      Failure/Error: expect(mindy.happiness).to eq(7)
     
#        expected: 7
#             got: 3
end
