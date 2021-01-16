class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    # validates :name, presence: true
    validates :password, presence: true
    # validates :height, presence: true
    # validates :happiness, presence: true
    # validates :nausea, presence: true
    # validates :tickets, presence: true

    def mood
        unless admin
           self.happiness > self.nausea ? "happy" : "sad"
        end
    end

end
