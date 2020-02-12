class UsersController < ApplicationController
 before_action :require_login, only: [:show]

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :nausea, :height, :tickets, :admin)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
