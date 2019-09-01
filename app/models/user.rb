class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  before_save :default_values

  has_secure_password

  def mood
    if self.nausea && self.happiness
      self.nausea > self.happiness ? 'sad' : 'happy'
    end
  end

  def default_values
    if self.admin.nil?
      self.admin = false
      self.save
    end
  end
end
