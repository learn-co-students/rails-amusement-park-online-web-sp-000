<<<<<<< HEAD
class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
end
=======
class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
end
>>>>>>> e8b0703528b15e83c1bb7b10c90cc4b17f96d7ed
