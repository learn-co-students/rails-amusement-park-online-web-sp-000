class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true

  def mood
    mood = "happy"
    if self.nausea > self.happiness
      mood = "sad"
    end
    mood
  end
end
