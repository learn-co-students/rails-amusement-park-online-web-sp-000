class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.now[:alert] = "Email or Password is INVALID"
            redirect_to '/signin'
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end