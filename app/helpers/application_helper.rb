module ApplicationHelper
    def is_admin?
        current_user.admin
    end


    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        end
    end

    def logged_in?
        session[:user_id].present?
    end
end
