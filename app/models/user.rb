class User < ActiveRecord::Base

    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    validates :name, presence: true
    validates :admin, inclusion: { in: [true, false] }
    validates :tickets, numericality: true
    validates :nausea, numericality: true
    validates :happiness, numericality: true
    validates :height, numericality: true

    

    def mood
        if nausea > happiness
            "sad"
        else
            "happy"
        end
    end

end
