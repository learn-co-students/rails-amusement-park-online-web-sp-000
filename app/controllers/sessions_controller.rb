class SessionsController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(id: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/signin"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
