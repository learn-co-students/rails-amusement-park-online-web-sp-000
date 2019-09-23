class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create

    user = User.find session_params[:user_name]
    user = user.try :authenticate, session_params[:password]

    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id

    @user = user

    redirect_to user_path @user
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:user_name, :password)
  end
end
