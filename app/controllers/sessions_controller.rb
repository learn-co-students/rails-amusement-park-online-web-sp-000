class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
      @user = User.find(session_params[:id])
    if @user && @user = @user.try(:authenticate, session_params[:password])      
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      redirect_to signin_path
    end
  end

  def show
    render 'users/show'
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:id, :password)
  end

end
