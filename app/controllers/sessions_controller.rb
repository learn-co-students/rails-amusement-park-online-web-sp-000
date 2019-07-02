class SessionsController < ApplicationController

    def welcome
    end

    def signin
        @users = User.all
        @user = User.new
    end

    def new
        @user = User.new
        @users = User.all
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user
            session[:user_id] = @user.id
            redirect_to @user
        end
    end

    def destroy
        # binding.pry
        session.delete :user_id
        redirect_to '/'
    end
end

