module ApplicationHelper

    def is_logged_in?
        !!session[:user_id]
    end
    
    def current_user
        User.find(session[:user_id])
    end

    def menu
        if is_logged_in?
            render 'loggedin'
        else
            render 'loggedout'
        end
    end

end
