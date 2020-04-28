class Ride < ApplicationRecord
	belongs_to :user
	belongs_to :attraction

	def take_ride
		if (self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height)
			# flash[:notice] = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
		elsif self.user.tickets < self.attraction.tickets
			# flash[:notice] = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
			"Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		elsif self.user.height < self.attraction.min_height
			# flash[:notice] = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
			"Sorry. You are not tall enough to ride the #{self.attraction.name}."
		else
			user = User.find(self.user.id) 
			
			user.tickets -= self.attraction.tickets
			user.nausea += self.attraction.nausea_rating
			user.happiness += self.attraction.happiness_rating
			# user.update(tickets: user.tickets -= self.attraction.tickets)
			# flash[:notice] = "Thanks for riding the #{self.attraction.name}!"
			user.save
			self.save
			"Thanks for riding the #{self.attraction.name}!"
		end
	end
end
