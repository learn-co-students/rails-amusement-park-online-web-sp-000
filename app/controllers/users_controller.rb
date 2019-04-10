class UsersController < ApplicationController
  skip_before_action :verify_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @message = params[:message]
  end

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
  end 
end
