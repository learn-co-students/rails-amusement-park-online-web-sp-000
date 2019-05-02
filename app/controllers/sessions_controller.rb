class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    session[:user_id] = @user.id
    if logged_in?
      redirect_to user_path(@user)
    else
      return redirect_to signin_path
    end
  end

  def destroy
    if logged_in?
      session.delete :user_id
      redirect_to root_path
    else
      return redirect_to root_path
    end
  end
end
