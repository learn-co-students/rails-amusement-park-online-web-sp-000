class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
  validates :name, :min_height, :happiness_rating, :nausea_rating, :tickets, :presence => true
  


end
