class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  #validates :password, presence: true
  #validates :height, numericality: {greater_than: 0}
  #validates :height, numericality: {less_than_or_equal_to: 200}
  
  def mood
    #binding.pry
    if self.nausea && self.nausea > self.happiness
      "sad"
    elsif self.happiness && self.happiness > self.nausea
      "happy"
    end
  end

end
