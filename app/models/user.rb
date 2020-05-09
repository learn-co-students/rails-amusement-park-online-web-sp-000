class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if self.nausea.to_i >= self.happiness.to_i
            "sad"
        else
            "happy"
        end
    end
end
