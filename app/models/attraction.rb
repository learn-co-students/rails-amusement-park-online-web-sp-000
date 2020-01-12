class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides

    def self.find_name(attraction_id)
        Attraction.find(attraction_id).name
    end
end
