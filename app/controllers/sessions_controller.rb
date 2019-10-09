class SessionsController < ApplicationController


    def new

    end

    def create
        @user = User.find_by(name: params[:user][:name])
        @user = user.try(:authenticate, params[:user][:password])
        redirect_to root_path unless @user

        session[:user_id] = @user.id 
        redirect_to 
    end
end