class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates :name, presence: true
    validates :password_digest, presence: true
  
    def mood
        if self.nausea != nil && self.happiness !=nil
            self.happiness > self.nausea ? "happy" : "sad"
        end
    end

end
