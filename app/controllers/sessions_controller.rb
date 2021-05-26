class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
