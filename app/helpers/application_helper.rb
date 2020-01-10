module ApplicationHelper
    def logged_in?
        !!current_user
    end
    
    def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def admin?
        current_user.admin
    end
end
