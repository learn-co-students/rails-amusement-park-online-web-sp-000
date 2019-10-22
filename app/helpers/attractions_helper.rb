module AttractionsHelper
    def is_admin?
        if session[:user_id] 
            @user = User.find_by :id=>session[:user_id]
        end
        @user.admin
    end

end
