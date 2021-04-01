class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    validates :password_digest, presence: true
    def mood
        if !self.nausea.nil? && !self.happiness.nil?
            if self.nausea > self.happiness
                "sad"
            else
                "happy"
            end
        else
            "N/A"
        end
    end
end
