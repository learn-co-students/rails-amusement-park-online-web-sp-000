class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    redirect_to '/' unless @user && session[:user_id]
  end

  def new
    
  end
  
  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :tickets, :height, :happiness, :nausea, :admin)
  end
  
end