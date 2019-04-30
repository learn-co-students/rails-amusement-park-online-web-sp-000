class User < ActiveRecord::Base

  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea && happiness
      mood = happiness - nausea
      mood > 0 ? "happy" : "sad"
    end
  end

end
