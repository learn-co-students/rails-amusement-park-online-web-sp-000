class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  after_initialize :init

  def mood
    happiness > nausea ? 'happy' : 'sad' if happiness && nausea
  end

  private
  def init
    self.admin  ||= false
  end

end
