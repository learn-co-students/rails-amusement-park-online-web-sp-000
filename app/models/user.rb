class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    return if nausea.nil? || happiness.nil?
    return 'sad' if nausea > happiness
    return 'happy' if happiness > nausea
  end
end
