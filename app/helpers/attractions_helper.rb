module AttractionsHelper
    def new_attraction_link
        if session[:user_id]
            user = User.find(session[:user_id])
            if user.admin
                link_to "New Attraction", "some_link"
            end
        end
    end

    def show_attraction_link(attraction)
        if session[:user_id]
            user = User.find(session[:user_id])
            if user.admin
                link_to "Show #{attraction.name}", attraction_path(attraction)
            else
                link_to "Go on #{attraction.name}", attraction_path(attraction)
            end
        end
    end
end
