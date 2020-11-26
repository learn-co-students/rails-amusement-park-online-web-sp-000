class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    def user_name
        self.name
    end

    def user_name=(name)
        self.name = name
    end

    def mood
        if self.happiness.to_i > self.nausea.to_i
            'happy'
        elsif self.happiness.to_i < self.nausea.to_i
            'sad'
        end
    end

    def admin?
        self.admin ? true : false
    end
end
