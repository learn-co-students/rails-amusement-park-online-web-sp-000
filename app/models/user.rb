class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        # if self.nausea > self.happiness
        #     "sad"
        # end
        # binding.pry
        if self.happiness.to_i > self.nausea.to_i
            "happy"
        else
            "sad"
        end
    end
end
