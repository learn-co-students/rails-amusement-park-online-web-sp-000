class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session_hash
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
