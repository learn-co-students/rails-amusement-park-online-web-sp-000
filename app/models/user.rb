class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    validates :name, presence: true
    validates :name, uniqueness: true
    #validates :height, presence: true
    #validates :tickets, presence: true
    #validates :happiness, presence: true
    #validates :nausea, presence: true

    def mood

        self.happiness > self.nausea ? "happy" : "sad" if !self.admin
    end
end
