module AttractionsHelper
    def go_vs_show
      return 'Show' if current_user.admin
      'Go on'
    end

    def ride_button
      button_to "Go on this ride", {controller: :rides, action: :create, attraction_id: @attraction.id, user_id: session[:user_id]}, method: :post
    end

    def admin_edit
      link_to "Edit Attraction", edit_attraction_path
    end

    def ride_or_edit
      if current_user.admin
        admin_edit
      else
        ride_button
      end
    end

    def current_user 
      user = User.find(session[:user_id])
    end
end
