module ApplicationHelper

    def current_user
        user = User.find_by(id: session[:user_id])
    end

    def admin?
        current_user.admin
    end
end
