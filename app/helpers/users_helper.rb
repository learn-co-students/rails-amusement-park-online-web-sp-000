module UsersHelper

  def mood(user)
    if user.happiness == 1
      user.happiness = "sad"
    elsif user.happiness == 2
      user.happiness = "happy"

    elsif user.happiness == 3
      user.happiness = "happy"

    elsif user.happiness == 4
      user.happiness = "happy"

    elsif user.happiness == 5
      user.happiness = "happy"
    end
  end

end
