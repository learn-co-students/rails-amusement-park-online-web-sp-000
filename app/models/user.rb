class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        'sad'
      else
        'happy'
      end
    end
  end
end




# it "has a method 'mood' that returns 'sad' when the user is more nauseous than happy" do
#     expect(user.mood).to eq("sad")
#   end

#   it "has a method 'mood' that returns 'happy' when the user is more happy than nauseous" do
#     user.update(:happiness => 7)
#     expect(user.mood).to eq("happy")
#   end