class SessionsController < ApplicationController

  def new
  end
  
  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user.validate
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      binding.pry
    end
  end
  
end