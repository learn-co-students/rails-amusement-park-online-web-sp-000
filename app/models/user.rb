class User < ActiveRecord::Base

  [:name, :password].each do |attribute|
    validates(attribute, presence: true)
  end

  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness && self.nausea
      if self.happiness > self.nausea
        return "happy"
      else
        return "sad"
      end
    else
      return "neutral"
    end
  end

  def admin?
    self.admin
  end

end
