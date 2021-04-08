class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      flash[:warning] = 'Invalid Name or Password'
      redirect_to '/login'
    end
  end

  def destroy
  end
end
