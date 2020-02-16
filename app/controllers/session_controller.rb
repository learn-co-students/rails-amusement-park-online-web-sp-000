class SessionController < ApplicationController

  def create  

    user = User.find(params[:user][:name])

    if user.authenticate(params[:password])
      session[:user_id] = params[:user][:name]
      redirect_to user_path(user)
      else
      render 'users/signin'
      end

  end

  end