class Attraction < ApplicationRecord
  # rails g resource Attraction name:string tickets:integer nausea_rating:integer happiness_rating:integer min_height:integer --no-test-framework --skip
  has_many :rides
  has_many :users, through: :rides
end
