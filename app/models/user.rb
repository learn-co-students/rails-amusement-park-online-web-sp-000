class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if happiness 
      happiness < nausea ? "sad" : "happy"
    end
  end
   
end
