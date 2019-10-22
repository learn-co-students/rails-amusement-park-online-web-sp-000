class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    validates :password_digest, :name, presence: true
    has_secure_password

    def mood
        if self.nausea.present? && self.happiness.present?
            if self.nausea > self.happiness
                'sad'
            else
                'happy'
            end
        end
    end
end