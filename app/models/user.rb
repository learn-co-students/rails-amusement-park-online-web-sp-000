class User < ApplicationRecord
	has_secure_password

	has_many :rides
	has_many :attractions, through: :rides 

	validates :password_digest, presence: true

	def mood
		if self.admin == false
			if self.happiness > self.nausea
				"happy"
			elsif self.happiness < self.nausea
				"sad"
			end
		end
		# "happy" if self.happiness > self.nausea
		# "sad" if self.happiness < self.nausea
	end
end
