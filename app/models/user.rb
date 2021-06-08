class User < ApplicationRecord
    validates :name, uniqueness: true, length: { in: 6..16 }
    validates :password, presence: true, length: { in: 6..12 }
    validates :happiness, length: { in: 1..10 }
    validates :nausea, length: { in: 1..10 }
    validates :height, length: { in: 16..75 }
    validates :tickets, length: { in: 0..500 }
    validates :admin # boolean defaults to false
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
end
