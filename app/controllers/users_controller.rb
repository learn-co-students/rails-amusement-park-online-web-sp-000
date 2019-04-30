class UsersController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
    @notice = params[:notice]
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  end

end
