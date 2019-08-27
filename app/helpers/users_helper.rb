module UsersHelper

  def mood(user)
#    binding.pry
    if user.nausea > user.happiness
      user.happiness = "sad"
    elsif  user.nausea < user.happiness
      user.happiness = "happy"
    end
  end

end
