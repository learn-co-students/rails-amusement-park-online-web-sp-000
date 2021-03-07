class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if nausea > happiness
            return 'sad'
        elsif happiness > nausea
            return 'happy'
        else 
            return 'eh'
        end
    end

    def admin= (input)
        if (input == "1")
            self.update(admin: true)
        else
            self.update(admin: false)
        end
    end

end
