class User < ApplicationRecord
	
	has_secure_password
	has_many :rides
	has_many :attractions, through: :rides
	
	after_initialize :init
	validates :name, presence: true 

	def mood
		if self.happiness > self.nausea
			'happy'
		else
			'sad'
		end
	end

	def init
		self.admin ||= false
	end

end
