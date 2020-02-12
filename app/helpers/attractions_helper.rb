module AttractionsHelper
    def new_attraction_link
        if session[:user_id]
            user = User.find(session[:user_id])
            if user.admin
                link_to "New Attraction", new_attraction_path
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

    def edit_attraction_link(attraction)
        if session[:user_id]
            user = User.find(session[:user_id])
            if user.admin
                link_to "Edit Attraction", edit_attraction_path(attraction)
            else
                button_to "Go on this ride", {:controller => "attractions", :action => "ride", :attraction_id => @attraction.id, :user_id=> session[:user_id]} , :method=>:post
            end
        end
    end
end
