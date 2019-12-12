class SessionsController < ApplicationController

    def signin
    end

    def login
        @user = User.find_by :name=>params[:user][:name]
        if @user && @user.authenticate(params[:password])
            session[:user_id]=@user.id
            redirect_to user_path(@user)
        else
            redirect_to "/signin"
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end
