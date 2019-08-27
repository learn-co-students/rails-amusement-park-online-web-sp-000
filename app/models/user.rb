class User < ApplicationRecord
  validates :password, presence: true

  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
end
