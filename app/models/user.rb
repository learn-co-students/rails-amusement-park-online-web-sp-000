class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  # returns 'sad' when the user is more nauseous than happy
  # returns 'happy' when the user is more happy than nauseous
  def mood
    if self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end
end
