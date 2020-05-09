class SessionsController < ApplicationController
    def home
    end

    def new
        @user = User.new
    end

    def create
        user = User.find_by(id: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        if user
            session[:user_id] = user.id
            @user = user
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end
