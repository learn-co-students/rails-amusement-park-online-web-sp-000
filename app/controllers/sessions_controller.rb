class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user.authenticate(params[:user][:password])
            redirect_to signup_path
        else
            session[:user_id] = @user.id
            redirect_to user_attractions_path
        end
    end
end