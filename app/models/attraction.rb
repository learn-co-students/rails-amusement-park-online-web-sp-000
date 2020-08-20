class Attraction < ApplicationRecord

    validates :name, presence: true
    validates :tickets, numericality: true
    validates :nausea_rating, numericality: true
    validates :happiness_rating, numericality: true
    validates :min_height, numericality: true
    
    has_many :rides
    has_many :users, through: :rides
end
