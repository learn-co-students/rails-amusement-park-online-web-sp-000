class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find(params[:user_name])
    if user.password == params[:password]
      session[:user_id] = params[:user_name]
      session[:admin] = user.admin
      redirect_to user_path(current_user)
    else
      return redirect_to controller: 'sessions', action: "new"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to controller: 'welcome', action: 'home'
  end
end