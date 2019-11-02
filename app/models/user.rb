class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.admin == true
      "happy"
    else
      self.nausea < self.happiness ? "happy":"sad"
    end
  end

end
