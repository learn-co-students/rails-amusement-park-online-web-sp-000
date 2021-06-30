class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides
    
    def mood
    if !admin
        if happiness > nausea
            return "happy"
        else
            return "sad"
        end
    end
    end
end
