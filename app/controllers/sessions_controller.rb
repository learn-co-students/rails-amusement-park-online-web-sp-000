class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Authentication failed! Invalid Credentials!"
      render :new
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end
end
