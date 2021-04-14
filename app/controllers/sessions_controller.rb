class SessionsController < ApplicationController
  def new
    @user = User.new
    @people = User.all
  end

  def create
    @user = User.find(params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:warning] = 'Invalid Name or Password'
      redirect_to '/signin'
    end
  end

  def destroy
  end
end
