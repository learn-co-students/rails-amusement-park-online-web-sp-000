class UsersController < ApplicationController
 before_action :require_login, only: [:show]

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log_in(@user)
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
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
