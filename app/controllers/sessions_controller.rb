class SessionsController < ApplicationController
    def new #signin page for an existing user
        @users = User.all
    end

    def create #signs in an existing user
        @user = User.find(params[:user_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to(@user)
        else
            @users = User.all
            render 'new'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
