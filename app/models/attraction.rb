class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides

    def user_count
        Ride.where(:attraction_id => "#{self.id}").size
    end
end
