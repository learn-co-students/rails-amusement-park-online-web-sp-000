module AttractionsHelper
  def admin?
    current_user.admin
  end

  def user_index(attraction)
    if current_user.admin?
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end
end
