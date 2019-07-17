class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, :presence => true

  def mood
    if nausea && happiness
      nausea > happiness ? "sad" : "happy"
    else
      "neutral"
    end
  end
end
