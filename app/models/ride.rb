require "pry"

class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    not_enough_tickets = self.user.tickets < self.attraction.tickets
    not_tall_enough = self.user.height < self.attraction.min_height
    updated_ticket_number = self.user.tickets - self.attraction.tickets
    updated_nausea = self.user.nausea + self.attraction.nausea_rating
    updated_happiness = self.user.happiness + self.attraction.happiness_rating

    if not_enough_tickets && not_tall_enough
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_tall_enough
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif not_enough_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}." #add flash[:message] = to these lines here?
    else
      self.user.tickets = updated_ticket_number
      self.user.nausea = updated_nausea
      self.user.happiness = updated_happiness
      self.user.save
      return ""
    end
  end
end

# it "has a method 'take_ride' that accounts for the user not having enough tickets" do
#     ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#     expect(ride.take_ride).to eq("Sorry. You do not have enough tickets to ride the #{attraction.name}.")
#     expect(user.tickets).to eq(4)
#     expect(user.happiness).to eq(3)
#     expect(user.nausea).to eq(5)
#   end

# it "has a method 'take_ride' that updates ticket number" do
#     user.update(:tickets => 10)
#     ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#     ride.take_ride
#     mindy = User.find_by(:name => "Mindy")
#     expect(mindy.tickets).to eq(5)
#   end

#   it "has a method 'take_ride' that updates the user's nausea" do
#     user.update(:tickets => 10)
#     ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#     ride.take_ride
#     mindy = User.find_by(:name => "Mindy")
#     expect(mindy.nausea).to eq(7)
#   end

#   it "has a method 'take_ride' that updates the user's happiness" do
#     user.update(:tickets => 10)
#     ride = Ride.create(:user_id => user.id, :attraction_id => attraction.id)
#     ride.take_ride
#     mindy = User.find_by(:name => "Mindy")
#     expect(mindy.happiness).to eq(7)
#   end
# end
