class UsersController < ApplicationController
  def index
  end
  
  def create
    
    @user = User.create(user_params)

    if @user && @user.try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def show
     
  end

  private

 
  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end
end