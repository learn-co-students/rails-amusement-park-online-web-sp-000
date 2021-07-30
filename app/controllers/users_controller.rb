class UsersController < ApplicationController 
  before_action :authenticate_user, only: [:show]
  
  def new 
    @user = User.new
    # byebug
  end 
  
  def create 
    
    @user = User.new(user_params)
    # byebug
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render 'new'
  end
end

  def index
  end

def show 
  
  #  byebug
  # @user = User.find_by(id: params[:id])
  @user = current_user
  # if !current_user.admin
    # if current_user != @user 
  #   redirect_to root_path
  # end
end
end
private
def user_params
  params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
end


