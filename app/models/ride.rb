class Ride < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user

	def take_ride
		if enough_tickets? && tall_enough?
			experience_ride
		elsif !enough_tickets? && tall_enough?
			sorry_string + insufficient_tickets_string
		elsif enough_tickets? && !tall_enough?
			sorry_string + insufficient_height_string
		else
			sorry_string + insufficient_tickets_string + insufficient_height_string
		end
	end

	private

	def enough_tickets?
		self.user.tickets >= self.attraction.tickets
	end

	def tall_enough?
		self.user.height >= self.attraction.min_height
	end

	def experience_ride
		self.user.tickets -= self.attraction.tickets
		self.user.nausea += self.attraction.nausea_rating
		self.user.happiness += self.attraction.happiness_rating
		self.user.save
		"Thanks for riding the #{self.attraction.name}!"
	end

	def sorry_string
		"Sorry."
	end

	def insufficient_tickets_string
		" You do not have enough tickets to ride the #{self.attraction.name}."
	end

	def insufficient_height_string
		" You are not tall enough to ride the #{self.attraction.name}."
	end

end
