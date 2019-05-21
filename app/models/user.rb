class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea.to_i > happiness.to_i
      "sad"
    elsif happiness.to_i > nausea.to_i
      "happy"
    end
  end
end
