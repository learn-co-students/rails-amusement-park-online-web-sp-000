class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if !self.nausea.nil? && !self.happiness.nil?
            if self.nausea > self.happiness
                self.mood = "sad"
            else 
                self.mood = "happy"
            end
        end
    end

end
