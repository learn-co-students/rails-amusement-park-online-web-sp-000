class User < ApplicationRecord
    has_secure_password

    has_many :rides
    has_many :attractions, :through => :rides
    # validates :password, :presence => true

    def mood 
        if self.happiness && self.nausea
            self.happiness > self.nausea ? 'happy' : 'sad'
        end
    end

end
