class Ride < ApplicationRecord
	belongs_to :user
	belongs_to :attraction

	def self.rid?
		
	end

	def take_ride
		if (self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height)
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
		elsif self.user.tickets < self.attraction.tickets
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		elsif self.user.height < self.attraction.min_height
			"Sorry. You are not tall enough to ride the #{self.attraction.name}."
		else
			user = User.find(self.user.id) 
			
			user.tickets -= self.attraction.tickets
			user.nausea += self.attraction.nausea_rating
			user.happiness += self.attraction.happiness_rating
			# user.update(tickets: user.tickets -= self.attraction.tickets)
			user.save
			self.save
		end
	end
end
