class User < ActiveRecord::Base
  has_secure_password
  validates :password, :presence => true
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness.nil? == false
      if self.nausea < self.happiness || self.happiness > 3
        "happy"
      else
        "sad"  
      end
    end
  end
  
end
