class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params['user']['name'])
    if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        redirect_to "/"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  def new
    @users = User.all
  end
end
