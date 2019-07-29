require 'pry'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def signin
    @users = User.all
  end

  def create_session
    user = User.find_by(:name => params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render 'signin'
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    if !helpers.logged_in?
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
