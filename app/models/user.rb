class User < ActiveRecord::Base
  [:name, :password].each do |attribute|
    validates(attribute, presence: true)
  end
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness > self.nausea
      return "happy"
    else
     return "sad"
   end
  end

end

#:happiness, :nausea, :height, :tickets #=> the additional validations causes the test to fail.
