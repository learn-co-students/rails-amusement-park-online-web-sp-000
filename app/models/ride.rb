class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction
	def take_ride
		user = self.user
		attraction = self.attraction
		if (attraction.tickets > user.tickets) && (attraction.min_height > user.height)
			"Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
		elsif attraction.tickets > user.tickets
			"Sorry. You do not have enough tickets to ride the #{attraction.name}."
		elsif attraction.min_height > user.height
			"Sorry. You are not tall enough to ride the #{attraction.name}."
		else
			new_ticket_count = user.tickets -= attraction.tickets
			new_happiness = user.happiness + attraction.happiness_rating
			new_nausea = user.nausea + attraction.nausea_rating
			user.update_attributes(:tickets => new_ticket_count, :happiness => new_happiness, :nausea => new_nausea)
			"Thanks for riding the #{attraction.name}!"
		end
	end
end
