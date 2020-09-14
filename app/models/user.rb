class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    # validates :name, presence: true
    # validates :password, presence: true
    # validates :happiness, presence: true
    # validates :nausea, presence: true
    # validates :height, presence: true
    # validates :tickets, presence: true

    has_secure_password

    def mood
        if self.happiness >= self.nausea
            "happy"
        else
            "sad"
        end
    end
end
