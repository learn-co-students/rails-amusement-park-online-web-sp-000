class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, uniqueness: true

  def mood=()
  end

  def mood
    if self.nausea && self.happiness
      ((self.nausea > self.happiness) ? 'sad' : 'happy')
    end
  end
end
