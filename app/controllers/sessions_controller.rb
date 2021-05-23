class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(id: params[:id])
    if @user.id.exists?
      raise params.inspect
    session_hash
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
