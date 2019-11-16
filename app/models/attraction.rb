class Attraction < ActiveRecord::Base

  [:name, :min_height, :happiness_rating, :nausea_rating, :tickets ].each do |attribute|
    validates(attribute, presence: true)
  end

  has_many :rides
  has_many :users, through: :rides


end
