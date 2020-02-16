class SessionController < ApplicationController

  def create  
    user = User.find(params[:user][:user_id])

    if user.authenticate(params[:password])
      session[:user_id] = params[:user_id]
      redirect_to user_path(user)
      else
      render 'users/signin'
      end

  end

  end