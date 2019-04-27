class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates_presence_of :password

  def mood
    moodcheck unless admin?
  end

  def moodcheck
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end

  def admin?
    self.admin
  end

end
