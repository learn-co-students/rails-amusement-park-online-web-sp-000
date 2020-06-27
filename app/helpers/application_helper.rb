module ApplicationHelper
    def current_user 
        @user = User.find(session[:user_id]) unless invalid_user
      end
    
    def invalid_user
        redirect_to '/signin' if User.find(session[:user_id]) == nil
    end
end
