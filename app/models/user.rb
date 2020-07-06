class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides


    def mood
        @happy = self.happiness
        @nausea = self.nausea
        if @happy > @nausea
            return "happy"
        else
            return "sad"
        end 
    end 

end
