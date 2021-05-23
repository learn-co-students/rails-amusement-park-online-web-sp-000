class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.nausea > self.happiness
      return "sad"
    elsif self.nausea < self.happiness
      return "happy"
    else
    end
  end

end
