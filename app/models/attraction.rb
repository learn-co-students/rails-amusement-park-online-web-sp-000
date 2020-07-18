class Attraction < ApplicationRecord
    has_many :riders
    has_many :users, through: :rides
end
