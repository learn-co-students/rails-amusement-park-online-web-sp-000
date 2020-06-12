class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        unless admin
             if nausea > happiness
                'sad'
            elsif 
            happiness > nausea
                'happy'
            end
        end
    end

end
