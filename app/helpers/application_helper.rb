module ApplicationHelper
    def display_signup_or_profile
        if session[:user_id]
            user = User.find(session[:user_id])
            link_to user.name, user_path(user), class: "navbar-brand"
        else
            link_to "Sign Up", signup_path, class: "navbar-brand"
        end
    end

    def display_signin_or_signout
        if session[:user_id]
            link_to "Log Out", logout_path, method: :delete, class: "navbar-brand"
        else
            link_to "Sign In", signin_path, class: "navbar-brand"
        end
    end
end
