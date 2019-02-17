class User < ApplicationRecord

  #validation
  validates :password, presence: true

  #relationships
  has_many :rides
  has_many :attractions, through: :rides

  #methods
  def mood
    self.happiness > self.nausea ? 'happy' : 'sad'
  end

end
