class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    validates_presence_of :password
    has_secure_password

    def mood
        if self.happiness == nil || self.nausea == nil
            return "not enough information"
        elsif self.happiness > self.nausea
            return "happy"
        elsif self.nausea > self.happiness
            return "sad"
        elsif self.happiness == self.nausea
            return "meh"
        end
    end

end
