class SessionsController < ActionController::Base

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to root_path
  end
end
