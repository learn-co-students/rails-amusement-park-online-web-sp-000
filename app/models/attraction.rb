class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def total_rides
    self.rides.size
  end
end
