class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood 
      #  binding.pry
        if self.happiness < self.nausea
            "sad"
        elsif self.nausea < self.happiness 
            "happy"
        end 
    end 
end
