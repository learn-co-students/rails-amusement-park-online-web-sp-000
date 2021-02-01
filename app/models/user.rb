class User < ActiveRecord::Base  
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if !self.happiness.blank? && !self.nausea.blank?
      self.happiness >= self.nausea ? "happy" : "sad"
    end
  end
end
