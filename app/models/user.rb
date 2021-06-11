class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, presence: true, on: :create
  validates :name, presence: true, uniqueness: true
  validates :height, inclusion: {in: 1..100, message: "must be between 1 and 100"}, on: :create, :allow_blank => true
  validates :happiness, inclusion: {in: 1..5, message: "must be between 1 and 5"}, on: :create, :allow_blank => true
  validates :nausea, inclusion: {in: 1..5, message: "must be between 1 and 5"}, on: :create, :allow_blank => true
  
  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end

end
