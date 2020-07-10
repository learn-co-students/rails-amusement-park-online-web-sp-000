module AttractionsHelper
    def attraction_li(attraction, user)
        if user
          if user.admin?
            link_to "Show #{attraction.name}", attraction_path(attraction)
          else 
            link_to "Go on #{attraction.name}", attraction_path(attraction)  
          end
        else
          attraction.name
        end
      end
end
