class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true
  validates :height, presence: true, numericality: { only_integer: true }
  validates :happiness, presence: true, numericality: { only_integer: true }
  validates :nausea, presence: true, numericality: { only_integer: true }
  validates :tickets, presence: true, numericality: { only_integer: true }

  def mood
    happiness >= nausea ? 'happy' : 'sad'
  end
end
