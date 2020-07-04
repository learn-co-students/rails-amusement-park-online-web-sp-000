module AttractionsHelper
    def custom_index
        if admin?
            render 'attractions/admin_index'
        else
            render 'attractions/user_index'
        end
    end

    def custom_show
        if admin?
            render 'attractions/admin_show'
        else
            render 'attractions/user_show'
        end
    end

    def admin?
        @user = User.find(session[:user_id])
        if @user.admin
            true
        else
            false
        end
    end

end
