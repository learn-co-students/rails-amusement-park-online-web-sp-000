class User < ApplicationRecord
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    validates :name, presence: true
    # validates :happiness, presence: true
    # validates :nausea, presence: true
    # validates :height, presence: true
    # validates :tickets, presence: true

    def mood
      happiness.to_i > nausea.to_i ? "happy" : "sad"
    end
end
