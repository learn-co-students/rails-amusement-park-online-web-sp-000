class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true

  has_secure_password

  def mood
  	self.happiness <= self.nausea ? "sad" : "happy"  unless self.happiness.nil? || self.nausea.nil?
  end
end
