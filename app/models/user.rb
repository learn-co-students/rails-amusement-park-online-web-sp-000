class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    validates_presence_of :password

    def mood
        if self.happiness > self.nausea
            return "happy"
        elsif self.nausea > self.happiness
            return "sad"
        end
    end

end
