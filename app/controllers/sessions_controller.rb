class SessionsController < ApplicationController
  
    def home

    end
  
    def new
      @user = User.new
      @users = User.all
    end
  
    def create
      user = User.find_by(id: params[:user][:name])
      authenticated = user.try(:authenticate, params[:user][:password])
      if authenticated
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to '/signin'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

  end