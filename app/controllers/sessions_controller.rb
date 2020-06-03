class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.find_by(name: params[:user][:name])
      if @user 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end
    end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  # def signin
  #   @user = User.new
  # end

  # # def logout
  # #   session[:user_id] = nil
  # #   redirect_to home_path
  # # end

  # def authenticate
  #   @user = User.find(params[:user][:id])
  #   session[:user_id] = @user.id
  #   redirect_to user_path(@user)
  # end

end
