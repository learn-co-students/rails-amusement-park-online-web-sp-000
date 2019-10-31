class User < ApplicationRecord
  has_secure_password

  validates :password, :presence => { :on => :create }, confirmation: true
  validates :name, :happiness, :nausea, :height, :tickets, presence: true

  has_many :rides
  has_many :attractions, through: :rides
end