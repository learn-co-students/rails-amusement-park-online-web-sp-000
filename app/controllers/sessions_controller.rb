class SessionsController < ApplicationController

    def new
        @users = User.all 
    end

    def create
        byebug
        @user = User.find_by(name: params[:user][:id])
        # byebug
        if !@user.authenticate(params[:user][:password])
            redirect_to users_new_path
        else
            session[:user_id] = @user.id
            redirect_to users_show_path
        end
    end
end