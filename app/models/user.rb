class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    def new
    end

    def create
    end

    def mood
        return "" if self.admin == true

        happiness = self.happiness
        nausea = self.nausea
        # binding.pry
        return "happy" if happiness > nausea
        return "sad" if nausea > happiness
    end
end
