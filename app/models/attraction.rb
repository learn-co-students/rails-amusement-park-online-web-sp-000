class Attraction < ApplicationRecord
  validates :name, :tickets, :nausea_rating, :happiness_rating, :min_height, presence: true
  has_many :rides
  has_many :users, through: :rides
end
