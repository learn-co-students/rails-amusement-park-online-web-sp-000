class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    def self.mood
        if self.nausea > self.happiness
            return 'happy'
        elsif self.nausea < self.happiness
            return 'sad'
        end
    end
end
