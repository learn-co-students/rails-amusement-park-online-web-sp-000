class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :name, presence: true

def mood
  if self.nausea > self.happiness
    return "sad"
  else
    self.happiness > self.nausea
    return "happy"
  end
end

end
