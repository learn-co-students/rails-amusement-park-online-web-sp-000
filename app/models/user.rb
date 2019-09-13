<<<<<<< HEAD
class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  
  validates :password_digest, presence: true
  
  def mood
    if happiness && nausea
      if happiness > nausea
        "happy"
      else
        "sad"
      end
    end
  end
=======
class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  
  validates :password_digest, presence: true
  
  def mood
    if happiness > nausea
      "happy"
    else
      "sad"
    end
  end
>>>>>>> e8b0703528b15e83c1bb7b10c90cc4b17f96d7ed
end