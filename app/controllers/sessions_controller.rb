require "pry"

class SessionsController < ApplicationController
  def new
  end

  def create #logging in a user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to signin_path
      end
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end
