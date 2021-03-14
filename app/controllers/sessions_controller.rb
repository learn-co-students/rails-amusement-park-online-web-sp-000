class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def create
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end
    def new

    end
    def destroy
        session.delete :user_id
        redirect_to root_path
    end


  end