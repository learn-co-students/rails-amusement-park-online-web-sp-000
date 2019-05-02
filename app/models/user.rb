class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates_presence_of :password

  def mood
    check_mood unless admin?
  end

  def check_mood
    if self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end

  def admin?
    self.admin
  end
end
