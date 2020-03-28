class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    self.happiness < self.nausea ? "sad" : "happy"
  end

  def tall_enough?(attraction)
    self.height >= attraction.min_height
  end
end
