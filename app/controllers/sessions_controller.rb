class SessionsController < ApplicationController
  skip_before_action :authorized_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name]) && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      session.clear
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
