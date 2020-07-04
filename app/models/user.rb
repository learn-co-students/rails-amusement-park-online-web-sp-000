class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def status
        if self.admin
            'ADMIN'
        end
    end

    def mood
        if !happiness.nil?
            if happiness > nausea
                'happy'
            else
                'sad'
            end
        end
    end

    def admin?
       !self.status.nil?
    end

end
