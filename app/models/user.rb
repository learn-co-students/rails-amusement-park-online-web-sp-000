class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :password_digest, presence: true

  def mood
    unless admin
      self.happiness > self.nausea ? "happy" : "sad"
    end
  end

end
