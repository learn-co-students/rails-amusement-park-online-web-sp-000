module UsersHelper

    def message
        if session[:message]
            message = session[:message]
            session.delete :message
            message
        end
    end

end
