class User < ActiveRecord::Base
#    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates :password, presence: true


    def mood
        unless self.admin
            if self.happiness > self.nausea
                "happy"
            else
                "sad"    
            end
        end
    end
end
