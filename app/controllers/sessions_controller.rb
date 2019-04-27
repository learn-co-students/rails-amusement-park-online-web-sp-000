class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    session[:user_id] = @user.id
    if !logged_in?
      redirect_to '/signin'
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
  if logged_in?
    session.delete :user_id
    redirect_to '/'
  else
    redirect_to '/signin'
  end
end


end
