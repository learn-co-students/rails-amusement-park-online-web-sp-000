class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    #log_in(@user)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    #log_out
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
