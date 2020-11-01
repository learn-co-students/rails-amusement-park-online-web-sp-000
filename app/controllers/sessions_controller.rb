class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to(controller: 'sessions', action: new)
    end
  end

  def destroy
    if !current_user
      redirect_to '/sessions/login'
    else
      session.delete :user_id
      redirect_to root_path
    end
  end

end
