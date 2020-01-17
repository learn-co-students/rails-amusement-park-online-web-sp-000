class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        # if admin
        #     "I have no emotion because I am an administrator."
        # end
        if admin
            "I have no emotion because I am an administrator."
        elsif nausea > happiness
            "sad"
        else
            "happy"
        end
    end

end
