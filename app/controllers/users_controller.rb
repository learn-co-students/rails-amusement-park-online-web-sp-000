class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/users/new'
    else
     User.new(user_params).save
     session[:user_id] = User.last.id
     redirect_to '/'
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
