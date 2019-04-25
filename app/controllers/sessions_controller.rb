require 'pry'
class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user_name])
    session[:user_id] = user.id
    redirect_to user
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
    end
    redirect_to root_path
  end

end
