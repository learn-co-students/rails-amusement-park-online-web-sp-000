class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, :presence => { :on => :create }, confirmation: true
  # validates :name, :happiness, :nausea, :height, :tickets, presence: true

  def mood
    if self.nausea>self.happiness
      "sad"
    else
      "happy"
    end
  end

end