class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if User.include?(@user)
      raise params.inspect
    else
      raise params.inspect
      redirect_to 'users#show'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
