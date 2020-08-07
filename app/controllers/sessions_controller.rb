class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(User.find(params[:user][:id]))
    # else
    #   flash[:error] = "Password does not match our records"
    #   redirect_to '/users/new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
