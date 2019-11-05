class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  validates :password, :presence => { :on => :create }, confirmation: true

  def sign_in_list
    self.class.all.map {|user| ["#{user.name}", user.id]}
  end


    
  def mood
    if self.nausea && self.happiness
      mood = self.happiness - self.nausea
      mood > 0 ? "happy" : "sad"
    end
  end

end

