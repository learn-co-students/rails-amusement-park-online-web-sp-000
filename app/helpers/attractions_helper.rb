module AttractionsHelper
    def link_text(ride)
        if current_user.admin
            "Show #{ride.name}"
        else
            "Go on #{ride.name}"
        end
    end
end
