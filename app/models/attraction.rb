class Attraction < ApplicationRecord
    attr_accessor :user_number
    has_many :rides
    has_many :users, through: :rides

end
