class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      if self.user.height < self.attraction.min_height
        return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      end
      self.user.tickets - self.attraction.tickets
    end
  end

end


# it "has a method 'take_ride' that accounts for the user not having enough tickets" do
#   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#   expect(ride.take_ride).to eq("Sorry. You do not have enough tickets to ride the #{attraction.name}.")
#   expect(user.tickets).to eq(4)
#   expect(user.happiness).to eq(3)
#   expect(user.nausea).to eq(5)
# end
#
# it "has a method 'take_ride' that accounts for the user not being tall enough" do
#   user.update(:height => 30, :tickets => 10)
#   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#   expect(ride.take_ride).to eq("Sorry. You are not tall enough to ride the #{attraction.name}.")
#   expect(user.tickets).to eq(10)
#   expect(user.happiness).to eq(3)
#   expect(user.nausea).to eq(5)
# end
#
# it "has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets" do
#   user.update(:height => 30)
#   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#   expect(ride.take_ride).to eq("Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}.")
#   expect(user.tickets).to eq(4)
#   expect(user.happiness).to eq(3)
#   expect(user.nausea).to eq(5)
# end
#
# it "has a method 'take_ride' that updates ticket number" do
#   user.update(:tickets => 10)
#   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#   ride.take_ride
#   mindy = User.find_by(:name => "Mindy")
#   expect(mindy.tickets).to eq(5)
# end
#
# it "has a method 'take_ride' that updates the user's nausea" do
#   user.update(:tickets => 10)
#   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#   ride.take_ride
#   mindy = User.find_by(:name => "Mindy")
#   expect(mindy.nausea).to eq(7)
# end
#
# it "has a method 'take_ride' that updates the user's happiness" do
#   user.update(:tickets => 10)
#   ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#   ride.take_ride
#   mindy = User.find_by(:name => "Mindy")
#   expect(mindy.happiness).to eq(7)
# end
# end
