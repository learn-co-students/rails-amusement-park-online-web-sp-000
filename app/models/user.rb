class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if !(admin)
            if nausea > happiness
                return 'sad'
            elsif happiness > nausea
                return 'happy'
            else 
                return 'eh'
            end
        end
    end


end
