module UsersHelper
    def flash_notice
        if flash[:notice]
            render 'users/flash_notice'
        end
    end
end
