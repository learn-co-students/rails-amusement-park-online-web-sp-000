class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    validates :password, presence: true
    has_secure_password
    
    
    def mood
        if self.nausea > self.happiness
            "sad"
        elsif self.nausea < self.happiness
             "happy"
        end
    end
    
end
