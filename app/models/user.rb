class User < ApplicationRecord
    has_secure_password
    # validates :name, presence: true#, uniqueness: true, length: { in: 6..16 }
    # validates :happiness, presence: true#, length: { in: 1..10 }
    # validates :nausea, presence: true, length: { in: 1..10 }
    # validates :height, presence: true#, length: { in: 16..75 }
    # validates :tickets, presence: true#, length: { in: 0..500 }
    # validates :admin # boolean defaults to false
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        # byebug
        if self.nausea > self.happiness
            # byebug
            return "sad"
        else
            return "happy"
        end
    end
end
