module ApplicationHelper
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authentication_required
        if !logged_in?
            redirect_to signin_path
        end
    end

    def custom_buttons
        if logged_in?
            render 'layouts/in_session_buttons'
        else
            render 'layouts/out_session_buttons'
        end
    end
    


end
