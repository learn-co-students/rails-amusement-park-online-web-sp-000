class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params.require(:user).permit(:name))
    if @user.authenticate(params.require(:password))
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "Sign in successfull"
    else
      redirect_to new_users_path, :alert => "Incorrect Password"
    end
  end

  def destroy
    session.clear if session[:user_id]
    redirect_to root_path
  end
end
