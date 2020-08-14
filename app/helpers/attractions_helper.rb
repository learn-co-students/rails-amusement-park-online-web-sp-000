module AttractionsHelper

    def attraction_link(attr)
        if current_user.admin
            link_to "Show #{attr.name}", attraction_path(attr)
        else
            link_to "Go on #{attr.name}", attraction_path(attr)
        end
    end

    def footer
        if current_user.admin
            render 'edit_link'
        else
            render 'go_on_ride'
        end
    end

end
