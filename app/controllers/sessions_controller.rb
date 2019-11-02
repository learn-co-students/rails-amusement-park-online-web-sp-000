class SessionsController < ApplicationController

  def new
    @users = User.all
    render "signin"
  end

  def signin
    # binding.pry
    @user = User.find_by(id: params[:user_name])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome back, #{current_user.name}!"
      redirect_to user_path(@user)
    else
      flash[:message] = "Wrong Name or Password. Please try again."
      redirect_to signin_path
    end
  end

  def logout
    session.destroy
    redirect_to root_path
  end

end
