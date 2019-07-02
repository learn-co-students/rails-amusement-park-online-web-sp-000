class SessionsController < ApplicationController

    def welcome
    end

    def signin
        @users = User.all
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        session[:user_id] = @user.id
        redirect_to @user
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
