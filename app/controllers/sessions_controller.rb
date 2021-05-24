class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user == nil
      redirect_to root_url
    else
      session_hash
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
