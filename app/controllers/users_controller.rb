class UsersController < ApplicationController
  def welcome
  end

  def new
    if !logged_in?
      @user = User.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      render 'admin/show' unless !@user.admin
    else
      redirect_to '/'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
  end

end
