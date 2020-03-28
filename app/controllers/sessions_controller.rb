class SessionsController < ApplicationController

  def new
  end

  def create
    redirect_to '/signin', alert: "Username not Found" unless user = User.find_by(name: params[:user][:name])
    redirect_to '/signin', alert: "Password incorrect" unless user.authenticate(params[:password])
    login(user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
