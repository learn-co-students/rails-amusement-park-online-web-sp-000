class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    
    
    
    def mood
        if self.nausea.nil? ||self.happiness.nil?
            "no mood"
        elsif self.nausea > self.happiness
            "sad"
        elsif self.nausea < self.happiness
            "happy"
        end
    end
    


    
end
