class User < ActiveRecord::Base
  has_secure_password

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
