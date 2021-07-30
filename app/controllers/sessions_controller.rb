# require 'pry'
class SessionsController < ApplicationController 
  
  def new
    @user = User.new 
    @users = User.all
  end 
  
  def create 
    @users = User.all
    # byebug
    @user = User.find_by(name: params[:user][:name])
    if @user 
      # byebug
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else 
        render root_path
      end
    else 
      render root_path
    end
  end   
  
  def destroy
    session.destroy
    redirect_to root_path
  end 
end