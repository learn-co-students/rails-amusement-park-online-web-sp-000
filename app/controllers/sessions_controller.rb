class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find(name: params[:name])
    raise params.inspect
    session_hash
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
