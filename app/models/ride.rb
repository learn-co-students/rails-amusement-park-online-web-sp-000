class Ride < ActiveRecord::Base
    has_many :users
    belongs_to :attraction
end
